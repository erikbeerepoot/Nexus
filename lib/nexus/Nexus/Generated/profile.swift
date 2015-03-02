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

	func packObject(jsonObject : JSON?) {
		first_name = jsonObject?["first_name"].string; 
		last_name = jsonObject?["last_name"].string; 
		real_name = jsonObject?["real_name"].string; 
		image_24 = jsonObject?["image_24"].string; 
		phone = jsonObject?["phone"].string; 
		image_32 = jsonObject?["image_32"].string; 
		image_48 = jsonObject?["image_48"].string; 
		skype = jsonObject?["skype"].string; 
		image_72 = jsonObject?["image_72"].string; 
		email = jsonObject?["email"].string; 
		image_192 = jsonObject?["image_192"].string; 

	}

	//NOTE: Mostly a placeholder / untested / nonfunctional
	func unpackObject() -> (NSData?) {
		var json : JSON? = nil;

		json?["first_name"].string = first_name;		
		json?["last_name"].string = last_name;		
		json?["real_name"].string = real_name;		
		json?["image_24"].string = image_24;		
		json?["phone"].string = phone;		
		json?["image_32"].string = image_32;		
		json?["image_48"].string = image_48;		
		json?["skype"].string = skype;		
		json?["image_72"].string = image_72;		
		json?["email"].string = email;		
		json?["image_192"].string = image_192;		

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