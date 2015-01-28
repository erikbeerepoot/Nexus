/**
 * @name: user
 * @author: Erik E. Beerepoot
 * @brief: None provided.
 * @notes: Autogenerated! Edit at your own risk!
 */

import Foundation

class user {
	var profileInstance : profile? = nil;
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
		let jsonObject : JSON? = JSON(jsonData);


		//Custom class, must call its packing code
		profileInstance = profile();
		let profileObject : AnyObject? = jsonObject?["profileInstance"].object;
		let profileData : NSKeyedArchiver.archiveDataWithRootObject(profileObject!);
		profileInstance?.packObject(data);
		 
		is_owner = jsonObject?["is_owner"].bool; 	 
		name = jsonObject?["name"].string; 	 
		deleted = jsonObject?["deleted"].bool; 	 
		color = jsonObject?["color"].string; 	 
		is_admin = jsonObject?["is_admin"].bool; 	 
		is_ultra_restricted = jsonObject?["is_ultra_restricted"].bool; 	 
		has_files = jsonObject?["has_files"].bool; 	 
		is_restricted = jsonObject?["is_restricted"].bool; 	 
		id = jsonObject?["id"].string; 	 
		is_primary_owner = jsonObject?["is_primary_owner"].bool; 	 		

 	}

 	func unpackObject() -> (NSData?) {
    var json : JSON? = nil;

		//Custom class, must call its packing code
		profileInstance = profile();
		let profileObject : AnyObject? = jsonObject?["profileInstance"].object;
		let profileData : NSKeyedArchiver.archiveDataWithRootObject(profileObject!);
		profileInstance?.packObject(data);
		json?["is_owner"].bool = is_owner;		
		json?["name"].string = name;		
		json?["deleted"].bool = deleted;		
		json?["color"].string = color;		
		json?["is_admin"].bool = is_admin;		
		json?["is_ultra_restricted"].bool = is_ultra_restricted;		
		json?["has_files"].bool = has_files;		
		json?["is_restricted"].bool = is_restricted;		
		json?["id"].string = id;		
		json?["is_primary_owner"].bool = is_primary_owner;		
		 		
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

