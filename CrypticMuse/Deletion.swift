//
//  Deletion.swift
//  CrypticMuse
//
//  Created by david kilmer on 6/17/16.
//  Copyright © 2016 david kilmer. All rights reserved.
//

class Deletion {
  
  class func search(term: String) -> [[String]] {
    var res: [[String]] = []
    let word = Word(withText: term)
    for i in 0..<word.letters.count {
      if (word.letters[i] > 0) {
        let prefix = "-\(Character(UnicodeScalar(97+i)))"
        let ns = subtract(letter: 97+i, from: word.strip)
        let ww = Word(withText: ns)
        let rr = find(sort: ww.sort)
        if (rr.count > 0) {
          for r in rr {
            res.append([prefix, r])
          }
        }
      }
    }
    return res
  }
  
  private class func find(sort: String) -> [String] {
    var res: [String] = []
    let db = SQLiteDB.sharedInstance()
    if let rows = db?.query("select w_text from words where w_sort='\(sort)' limit 1000") {
      for row in rows {
        if let text = row["w_text"] {
          res.append(text as! String)
        }
      }
    }
    return res
  }
  
  private class func subtract(letter: Int, from: String) -> String {
    var ss: [String] = []
    var removed = false
    for c in from.unicodeScalars {
      if (Int(c.value) == letter && !removed) {
        removed = true
      } else {
        ss.append("\(c)")
      }
    }
    return ss.joined(separator: "")
  }
}
