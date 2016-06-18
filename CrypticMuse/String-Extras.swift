//
//  String-Extras.swift
//  Swift Tools
//
//  Created by Fahim Farook on 23/7/14.
//  Copyright (c) 2014 RookSoft Pte. Ltd. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

extension String {
	func positionOf(_ sub:String)->Int {
		var pos = -1
		if let range = self.range(of: sub) {
			if !range.isEmpty {
				pos = self.characters.distance(from: self.startIndex, to: range.lowerBound)
			}
		}
		return pos
	}
	
	func subStringFrom(_ pos:Int)->String {
		var substr = ""
		let start = self.characters.index(self.startIndex, offsetBy: pos)
		let end = self.endIndex
//		println("String: \(self), start:\(start), end: \(end)")
		let range = start..<end
		substr = self[range]
//		println("Substring: \(substr)")
		return substr
	}
	
	func subStringTo(_ pos:Int)->String {
		var substr = ""
		let end = self.characters.index(self.startIndex, offsetBy: pos-1)
		let range = self.startIndex...end
		substr = self[range]
		return substr
	}
		
}

