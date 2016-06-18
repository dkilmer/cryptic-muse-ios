//
//  Word.swift
//  CrypticMuse
//
//  Created by david kilmer on 6/16/16.
//  Copyright © 2016 david kilmer. All rights reserved.
//

class Word {
  var text: String
  var strip: String
  var reverse: String
  var sort: String
  var letters: [Int]
  var mask: UInt32
  var length: Int
  
  required init(withText: String) {
    text = withText
    letters = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    mask = 0
    length = 0
    var ss: [String] = []
    var rs: [String] = []
    for c in text.lowercased().unicodeScalars {
      if (c.value >= 97 && c.value <= 122) {
        ss.append("\(c)")
        rs.insert("\(c)", at: 0)
        letters[Int(c.value) - 97] += 1
        mask = mask | (1 << (c.value - 97))
        length += 1
      }
    }
    strip = ss.joined(separator: "")
    reverse = rs.joined(separator: "")
    let sr = ss.sorted()
    sort = sr.joined(separator: "")
  }
  
  func contains(word: Word) -> Boolean {
    if (self.length < word.length) {
      return false
    }
    if ((self.mask & word.mask) != word.mask) {
      return false
    }
    for i in 0..<self.letters.count {
      if (self.letters[i] < word.letters[i]) {
        return false
      }
    }
    return true
  }
  
}
