//
//  Wildcard.swift
//  CrypticMuse
//
//  Created by david kilmer on 6/17/16.
//  Copyright © 2016 david kilmer. All rights reserved.
//

class Wildcard {
  
  class func search(term: String) -> [[String]] {
    var res: [[String]] = []
    let nw = term.lowercased()
      .replacingOccurrences(of: "?", with: "_")
      .replacingOccurrences(of: "*", with: "%")
    let db = SQLiteDB.sharedInstance()
    if let rows = db?.query("select w_text from words where w_strip like '\(nw)' limit 1000") {
      for row in rows {
        if let text = row["w_text"] {
          res.append([text as! String])
        }
      }
    }
    return res
  }
  
}
