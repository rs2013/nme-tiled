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

class TilesetImage {

	public var source(default, null):String;
	public var fileName(default, null):String;
	public var width(default, null):Int;
	public var height(default, null):Int;
	
	public function new(source:String, width:Int, height:Int) {
		this.source = source;
		// get fileName from path
		this.fileName = source.substr(source.lastIndexOf("/") + 1, source.length);
		this.width = width;
		this.height = height;
	}
	
}
