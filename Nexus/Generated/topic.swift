/**
 * @name: topic
 * @author: Erik E. Beerepoot
 * @brief: None provided.
 * @notes: Autogenerated! Edit at your own risk!
 */

import Foundation

class topic {
	var last_set : Int? = nil;
	var value : String? = nil;
	var creator : String? = nil;

	func packObject(jsonData : NSData) {
		let jsonObject : JSON? = JSON(jsonData);

		last_set = jsonObject?["last_set"].int; 
		value = jsonObject?["value"].string; 
		creator = jsonObject?["creator"].string; 

	}

	func unpackObject() -> (NSData?) {
		var json : JSON? = nil;

		json?["last_set"].int = last_set;		
		json?["value"].string = value;		
		json?["creator"].string = creator;		

		//Now create data object
		var error : NSError? = nil;
		let object : AnyObject? = json?.object;
		if let data = NSJSONSerialization.dataWithJSONObject(object!, options: NSJSONWritingOptions.PrettyPrinted, error: nil) {
	        //post your data to server
	        return data;
	    } else {
	        //error
	        return nil;
	    }
	}
}