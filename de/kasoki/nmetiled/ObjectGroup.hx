// Copyright (C) 2012 Christopher Kaster
// 
// This file is part of nme-tiled.
// 
// nme-tiled is free software: you can redistribute it and/or modify it under the
// terms of the GNU Lesser General Public License as published by the Free
// Software Foundation, either version 3 of the License, or (at your option)
// any later version.
// 
// nme-tiled is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for
// more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with nme-tiled. If not, see: <http://www.gnu.org/licenses/>.
package de.kasoki.nmetiled;

class ObjectGroup {

	public var name(default, null):String;
	public var color(default, null):String;
	public var width(default, null):Int;
	public var height(default, null):Int;
	public var properties(default, null):Hash<String>;
	public var objects(default, null):Array<Object>;
	
	public function new(name:String, color:String, width:Int, height:Int, properties:Hash<String>, objects:Array<Object>) {
		this.name = name;
		this.color = color;
		this.width = width;
		this.height = height;
		this.properties = properties;
		this.objects = objects;
	}
	
	public static function fromXml(xml:Xml):ObjectGroup {
		var name = xml.get("name");
		var color = xml.get("color");
		var width = Std.parseInt(xml.get("width"));
		var height = Std.parseInt(xml.get("height"));
		var properties:Hash<String> = new Hash<String>();
		var objects:Array<Object> = new Array<Object>();
		
		for (child in xml) {
			if (Helper.isValidElement(child)) {
				if (child.nodeName == "properties") {
					for (property in child) {
						if (Helper.isValidElement(property)) {
							properties.set(property.get("name"), property.get("value"));
						}
					}
				}
				
				if (child.nodeName == "object") {
					objects.push(Object.fromXml(child));
				}
			}
		}
		
		return new ObjectGroup(name, color, width, height, properties, objects);
	}
	
}
