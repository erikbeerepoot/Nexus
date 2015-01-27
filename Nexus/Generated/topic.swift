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
 		let jsonObject : JSON? = JSON.parse(jsonData);
 		 		
 	 	last_set = jsonObject?["last_set"]?.int;
	 	value = jsonObject?["value"]?.string;
	 	creator = jsonObject?["creator"]?.string;
	 		
 	}

 	func unpackObject() -> (NSData) {
 		var jsonDict : Dictionary<String,AnyObject> = Dictionary();
	 	jsonDict["last_set"] = last_set;
	 	jsonDict["value"] = value;
	 	jsonDict["creator"] = creator;
	 		
		//return NSJSONSerialization.dataWithJSONObject(jsonDict,0,nil);
 	}
}

