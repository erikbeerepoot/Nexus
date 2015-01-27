/**
 * @name: profile
 * @author: Erik E. Beerepoot
 * @brief: None provided.
 * @notes: Autogenerated! Edit at your own risk!
 */

import Foundation

class profile {
 	var first_name : String? = nil;
 	var last_name : String? = nil;
 	var real_name : String? = nil;
 	var image_24 : String? = nil;
 	var phone : String? = nil;
 	var image_32 : String? = nil;
 	var image_48 : String? = nil;
 	var skype : String? = nil;
 	var image_72 : String? = nil;
 	var email : String? = nil;
 	var image_192 : String? = nil;
 	
 	func packObject(jsonData : NSData) {
 		let jsonObject : JSON? = JSON.parse(jsonData);
 		 		
 	 	first_name = jsonObject?["first_name"]?.string;
	 	last_name = jsonObject?["last_name"]?.string;
	 	real_name = jsonObject?["real_name"]?.string;
	 	image_24 = jsonObject?["image_24"]?.string;
	 	phone = jsonObject?["phone"]?.string;
	 	image_32 = jsonObject?["image_32"]?.string;
	 	image_48 = jsonObject?["image_48"]?.string;
	 	skype = jsonObject?["skype"]?.string;
	 	image_72 = jsonObject?["image_72"]?.string;
	 	email = jsonObject?["email"]?.string;
	 	image_192 = jsonObject?["image_192"]?.string;
	 		
 	}

 	func unpackObject() -> (NSData) {
 		var jsonDict : Dictionary<String,AnyObject> = Dictionary();
	 	jsonDict["first_name"] = first_name;
	 	jsonDict["last_name"] = last_name;
	 	jsonDict["real_name"] = real_name;
	 	jsonDict["image_24"] = image_24;
	 	jsonDict["phone"] = phone;
	 	jsonDict["image_32"] = image_32;
	 	jsonDict["image_48"] = image_48;
	 	jsonDict["skype"] = skype;
	 	jsonDict["image_72"] = image_72;
	 	jsonDict["email"] = email;
	 	jsonDict["image_192"] = image_192;
	 		
		//return NSJSONSerialization.dataWithJSONObject(jsonDict,0,nil);
 	}
}

