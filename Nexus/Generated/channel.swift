/**
 * @name: channel
 * @author: Erik E. Beerepoot
 * @brief: None provided.
 * @notes: Autogenerated! Edit at your own risk!
 */

import Foundation

 class channel {
 	var is_general : Bool? = nil;
 	var name : String? = nil;
 	var is_channel : String? = nil;
 	var created : Int? = nil;
 	var is_member : Bool? = nil;
 	var is_archived : Bool? = nil;
 	var creator : String? = nil;
 	var topic : Dictionary? = nil;
 	var unread_count : Int? = nil;
 	var purpose : Dictionary? = nil;
 	var members : Array? = nil;
 	var last_read : String? = nil;
 	var id : String? = nil;
 	
 	func packObject(jsonData : NSData) {
 		let jsonObject : JSON? = JSON.parse(jsonData);
 		 		
 	 	is_general = jsonObject?["is_general"]?.bool;
	 	name = jsonObject?["name"]?.string;
	 	is_channel = jsonObject?["is_channel"]?.string;
	 	created = jsonObject?["created"]?.int;
	 	is_member = jsonObject?["is_member"]?.bool;
	 	is_archived = jsonObject?["is_archived"]?.bool;
	 	creator = jsonObject?["creator"]?.string;
	 	topic = jsonObject?["topic"]?.dictionary;
	 	unread_count = jsonObject?["unread_count"]?.int;
	 	purpose = jsonObject?["purpose"]?.dictionary;
	 	members = jsonObject?["members"]?.array;
	 	last_read = jsonObject?["last_read"]?.string;
	 	id = jsonObject?["id"]?.string;
	 		
 	}

 	func unpackObject() -> (NSData) {
 		var jsonDict : Dictionary = Dictionary();
	 	jsonDict["is_general"] = is_general;
	 	jsonDict["name"] = name;
	 	jsonDict["is_channel"] = is_channel;
	 	jsonDict["created"] = created;
	 	jsonDict["is_member"] = is_member;
	 	jsonDict["is_archived"] = is_archived;
	 	jsonDict["creator"] = creator;
	 	jsonDict["topic"] = topic;
	 	jsonDict["unread_count"] = unread_count;
	 	jsonDict["purpose"] = purpose;
	 	jsonDict["members"] = members;
	 	jsonDict["last_read"] = last_read;
	 	jsonDict["id"] = id;
	 		
		return NSJSONSerialization.dataWithJSONObject(jsonDict,0,nil);
 	}
 }