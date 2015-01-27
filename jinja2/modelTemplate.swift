class {{className}} {
 	{% for var in variables %}
var {{var.varName}} : {{var.varType}}{% if var.varOptional %}?{% endif %} = nil;
 	{% endfor %}

 	func pack{{classname}}Object(jsonData : NSData) {
 		let jsonObject : JSON? = JSON.parse(jsonData);
 		 		
 	{% for var in variables %}
 	{{var.varName}} = jsonObject?["{{var.varName}}"]?.{{var.varType.lower()}};
	{% endfor %} 		
 	}

 	func unpack{{classname}}Object() -> (NSData) {
 		var jsonDict : Dictionary<String,AnyObject> = Dictionary();
	{% for var in variables %}
 	jsonDict["{{var.varName}}"] = {{var.varName}};
	{% endfor %} 		
		//return NSJSONSerialization.dataWithJSONObject(jsonDict,0,nil);
 	}
}


