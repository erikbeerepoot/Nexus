//
//  SlackConnection.swift
//  Nexus
//
//  Created by Erik E. Beerepoot on 2014-12-21.
//  Copyright (c) 2014 Dactyl Studios. All rights reserved.
//

import Foundation
import StarscreamOSX

protocol SlackConnectionDelegate {
    func connectionDidFinishWithError(error : NSError?, sender: SlackConnection) -> ();
    func connectionDidDisconnectWithError(error : NSError?, sender : SlackConnection) -> ();
}

protocol SlackRealTimeConnectionDelegate {
    func didReceiveEvent(eventData : JSON, onConnection sourceConnect : SlackConnection) -> ();
}

class SlackConnection : WebSocketDelegate {
    //notification mechanisms
    var delegate : SlackConnectionDelegate? = nil;
    var rtDelegate : SlackRealTimeConnectionDelegate? = nil;
    var sentCallback : ((Bool,NSError?) -> ())? = nil;
    
    //state
    var enableRealTimeEvents : Bool = false;
    var connected : Bool = false;
    var authorized : Bool = false;
    var token : NSString? = nil;
    
    //websocket connection 
    var socket : WebSocket? = nil;
    
    /**
    @name: Connect
    @brief: Connects to slack (authenticated)
    @returns: Success (true) or failure (false)
    */
    func connect() -> (Bool){
        if(!authorized){ return false; }
        
        //we are authorized, attempt a connection
        println("Connecting...");
        
        let tokenDict = NSDictionary(object: token!, forKey: "token");
        let URL : NSURL = NSURL(string: SlackEndpoints.connect)!;
        performRequestWithURL(URL, queryParams:tokenDict,andCompletionHandler:connectionHandler);
        return true;
    }
    
    /**
    Connects to Slack, allowing for real time events (RTM) to be set off or on.
    @param realTimeEvents Flag indicating if we want to receive real-time updates from slack.
    @returns boolean indicating success or failure
    */
    func connect(enableRealTimeEvents realTimeEvents : Bool) -> (Bool) {
        enableRealTimeEvents = realTimeEvents;
        return connect();
    }
    
    
    /**
    @name: Disconnect
    @brief: Disconnects from Slack
    @returns: Success (true) or failure (false)
    */
    func disconnect() -> (Bool){
        return false;
    }
    
    func send(url : NSURL,sendObject : SerializableParameterObject, callback : ((result : Bool, error : NSError?) -> ())?) -> (){
        sentCallback = callback;
        performRequestWithURL(url,token!, serializableObject: sendObject, andCompletionHandler:sentHandler);
    }
    
    
    /**
     * @name: connectionHandler
     * @brief: Callback invoked when connection attempt completes
     * @param: data - data received
     * @param: urlResponse - URL response received
     * @param: error (optional) - Error received, nil if no error
     */
    func connectionHandler(data : NSData?, urlResponse : NSURLResponse!, error : NSError?) -> () {
        
        let httpResponse = urlResponse as NSHTTPURLResponse;
        if(data != nil && httpResponse.statusCode==200){
            let jsonObject = JSON(data:data!,options:NSJSONReadingOptions.MutableContainers);
            let result = jsonObject[kOKKey].int;
            if(result==1){
                //success!
                connected = true;
                
                //if we want real time events, we must connect to the websocket API now
                if(enableRealTimeEvents){
                    //create URL
                    let theUrl = jsonObject[kURLKey].string;
                    let url = NSURL(string: theUrl!)!;
                    
                    //connect to websocket
                    socket = WebSocket(url : url);
                    socket?.delegate = self;
                    socket?.connect();
                }
                
                //notify delegate we connected
                delegate?.connectionDidFinishWithError(nil,sender:self);
            } else {
                delegate?.connectionDidFinishWithError(error,sender:self);
                connected = false;
            }
        } else {
            //bad stuff happened
        }
    }
    
    
    /**
    * @name: sentHandler
    * @brief: Callback invoked when send completed
    * @param: data - data received
    * @param: urlResponse - URL response received
    * @param: error (optional) - Error received, nil if no error
    */
    func sentHandler(data : NSData?, urlResponse : NSURLResponse!, error : NSError?) -> () {
        if(data != nil){
            let jsonObject = JSON(data:data!,options:NSJSONReadingOptions.MutableContainers);
            let result = jsonObject[kOKKey].bool;
            sentCallback?(result!,error);
        }
    }
    
    //MARK: WebSocket delegate methods
    func websocketDidConnect() -> (){
        println("Websocket connected!");
    }
    
    func websocketDidDisconnect(error : NSError?) -> (){
        println("Websocket disconnected!");
    }
    
    func websocketDidWriteError(error : NSError?) -> (){
         println("Websocket writerror!");   
    }
    
    func websocketDidReceiveMessage(text : String) -> (){
        println(text);
        let jsonObject = JSON(data:text.dataUsingEncoding(NSASCIIStringEncoding)!,options:NSJSONReadingOptions.MutableContainers);
        let msgType = jsonObject["type"].string;
        println("Message type: \(msgType)")
        self.rtDelegate?.didReceiveEvent(jsonObject,onConnection: self);
    }
    
    func websocketDidReceiveData(data : NSData){
        println("got some data: \(data.length)");
    }
}