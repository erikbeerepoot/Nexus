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
	var topicInstance : topic? = nil;
	var purposeInstance : purpose? = nil;
	var members : Array<String>? = nil;
	var id : String? = nil;

	func packObject(jsonObject : JSON?) {
		name = jsonObject?["name"].string; 
		creator = jsonObject?["creator"].string; 
		is_archived = jsonObject?["is_archived"].bool; 
		created = jsonObject?["created"].int; 
		is_group = jsonObject?["is_group"].string; 
		//Custom class, must call its packing code
		topicInstance = topic();
		let topicObject : AnyObject? = jsonObject?["topicInstance"].object;
		let topicData : NSData = NSKeyedArchiver.archivedDataWithRootObject(topicObject!);
		topicInstance?.packObject(JSON(data:topicData));
		//Custom class, must call its packing code
		purposeInstance = purpose();
		let purposeObject : AnyObject? = jsonObject?["purposeInstance"].object;
		let purposeData : NSData = NSKeyedArchiver.archivedDataWithRootObject(purposeObject!);
		purposeInstance?.packObject(JSON(data:purposeData));
		//Array
		id = jsonObject?["id"].string; 

	}

	//NOTE: Mostly a placeholder / untested / nonfunctional
	func unpackObject() -> (NSData?) {
		var json : JSON? = nil;

		json?["name"].string = name;		
		json?["creator"].string = creator;		
		json?["is_archived"].bool = is_archived;		
		json?["created"].int = created;		
		json?["is_group"].string = is_group;		
		//Custom class, must call its unpacking code (placeholder)
		//Custom class, must call its unpacking code (placeholder)
		//Array
		json?["id"].string = id;		

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