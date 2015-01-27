/**
 * @name: user
 * @author: Erik E. Beerepoot
 * @brief: None provided.
 * @notes: Autogenerated! Edit at your own risk!
 */

import Foundation

 class user {
 	var profile : Dictionary? = nil;
 	var is_owner : Bool? = nil;
 	var name : String? = nil;
 	var deleted : Bool? = nil;
 	var color : String? = nil;
 	var is_admin : Bool? = nil;
 	var is_ultra_restricted : Bool? = nil;
 	var has_files : Bool? = nil;
 	var is_restricted : Bool? = nil;
 	var id : String? = nil;
 	var is_primary_owner : Bool? = nil;
 	
 	func packObject(jsonData : NSData) {
 		let jsonObject : JSON? = JSON.parse(jsonData);
 		 		
 	 	profile = jsonObject?["profile"]?.dictionary;
	 	is_owner = jsonObject?["is_owner"]?.bool;
	 	name = jsonObject?["name"]?.string;
	 	deleted = jsonObject?["deleted"]?.bool;
	 	color = jsonObject?["color"]?.string;
	 	is_admin = jsonObject?["is_admin"]?.bool;
	 	is_ultra_restricted = jsonObject?["is_ultra_restricted"]?.bool;
	 	has_files = jsonObject?["has_files"]?.bool;
	 	is_restricted = jsonObject?["is_restricted"]?.bool;
	 	id = jsonObject?["id"]?.string;
	 	is_primary_owner = jsonObject?["is_primary_owner"]?.bool;
	 		
 	}

 	func unpackObject() -> (NSData) {
 		var jsonDict : Dictionary = Dictionary();
	 	jsonDict["profile"] = profile;
	 	jsonDict["is_owner"] = is_owner;
	 	jsonDict["name"] = name;
	 	jsonDict["deleted"] = deleted;
	 	jsonDict["color"] = color;
	 	jsonDict["is_admin"] = is_admin;
	 	jsonDict["is_ultra_restricted"] = is_ultra_restricted;
	 	jsonDict["has_files"] = has_files;
	 	jsonDict["is_restricted"] = is_restricted;
	 	jsonDict["id"] = id;
	 	jsonDict["is_primary_owner"] = is_primary_owner;
	 		
		return NSJSONSerialization.dataWithJSONObject(jsonDict,0,nil);
 	}
 }