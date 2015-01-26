/**
 * @name: group
 * @author: Erik E. Beerepoot
 * @brief: None provided.
 * @notes: Autogenerated! Edit at your own risk!
 */

import Foundation

 class group {
 	var name : String? = nil;
 	var creator : String? = nil;
 	var is_archived : Bool? = nil;
 	var created : Int? = nil;
 	var is_group : String? = nil;
 	var topic : NSMutableDictionary? = nil;
 	var purpose : NSMutableDictionary? = nil;
 	var members : NSMutableArray? = nil;
 	var id : String? = nil;
 	
 	func packObject(jsonData : NSData) {
 		let jsonOptional : JSON? = JSON.parse(jsonData);
 		if(jsonOptional==nil){
 			return;
 		}

 		//get our variables out of the object
 		let jsonObject : JSON = jsonOptional!;
 	 	name = jsonObject["name"].String;
	 	creator = jsonObject["creator"].String;
	 	is_archived = jsonObject["is_archived"].Bool;
	 	created = jsonObject["created"].Int;
	 	is_group = jsonObject["is_group"].String;
	 	topic = jsonObject["topic"].NSMutableDictionary;
	 	purpose = jsonObject["purpose"].NSMutableDictionary;
	 	members = jsonObject["members"].NSMutableArray;
	 	id = jsonObject["id"].String;
	 		
 	}

 	func unpackObject() -> (NSData) {
 		var jsonDict : Dictionary = Dictionary();
	 	jsonDict["name"] = name;
	 	jsonDict["creator"] = creator;
	 	jsonDict["is_archived"] = is_archived;
	 	jsonDict["created"] = created;
	 	jsonDict["is_group"] = is_group;
	 	jsonDict["topic"] = topic;
	 	jsonDict["purpose"] = purpose;
	 	jsonDict["members"] = members;
	 	jsonDict["id"] = id;
	 		
		return NSJSONSerialization.dataWithJSONObject(jsonDict,0,nil);
 	}
 }