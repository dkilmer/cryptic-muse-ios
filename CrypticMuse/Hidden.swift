//
//  Hiiden.swift
//  CrypticMuse
//
//  Created by david kilmer on 6/17/16.
//  Copyright © 2016 david kilmer. All rights reserved.
//

class Hidden {
  
  class func search(term: String) -> [[String]] {
    var res: [[String]] = []
    let word = Word(withText: term)
    let s = word.strip
    let len = word.length-1
    for i in 1...3 {
      let combs = Combos.choose(items: i, from: len)
      for comb in combs {
        var ss = split(s: s, at: comb)
        var good = true
        var idx = 0
        for w in ss {
          let word = Word(withText: w)
          if (idx == 0) {
            if (!wordEndsWith(word: word)) {
              good = false
              break
            }
          } else if (idx == ss.count-1) {
            if (!wordStartsWith(word: word)) {
              good = false
              break
            }
          } else {
            if (!isWord(word: word)) {
              good = false
              break
            }
          }
          idx += 1
        }
        if (good) {
          ss[0] = "*\(ss[0])"
          ss[ss.count-1] = "\(ss[ss.count-1])*"
          res.append(ss)
        }
      }
    }
    return res
  }
  
  private class func isWord(word: Word) -> Bool {
    if (word.length == 1) {
      if (word.strip == "a" || word.strip == "i") {
        return true
      } else {
        return false
      }
    }
    let db = SQLiteDB.sharedInstance()
    if let rows = db?.query("select w_strip from words where w_strip = '\(word.strip)' limit 1") {
      if (rows.count > 0) {
        return true
      } else {
        return false
      }
    }
    return false
  }

  private class func wordStartsWith(word: Word) -> Bool {
    if (word.length == 1) {
      return true
    }
    let db = SQLiteDB.sharedInstance()
    if let rows = db?.query("select w_strip from words where w_strip like '\(word.strip)%' limit 1") {
      if (rows.count > 0) {
        return true
      } else {
        return false
      }
    }
    return false
  }
  
  private class func wordEndsWith(word: Word) -> Bool {
    if (word.length == 1) {
      return true
    }
    let db = SQLiteDB.sharedInstance()
    if let rows = db?.query("select w_strip from words where w_strip like '%\(word.strip)' limit 1") {
      if (rows.count > 0) {
        return true
      } else {
        return false
      }
    }
    return false
  }
  
  private class func split(s: String, at: [Int]) -> [String] {
    var idxs = Array(at[0..<at.count])
    var res: [String] = []
    var ss: [String] = []
    for c in s.unicodeScalars {
      ss.append("\(c)")
    }
    idxs.append(ss.count-1)
    var sp = 0
    for p in idxs {
      let ep = p+1
      let sub = Array(ss[sp..<ep])
      let subStr = sub.joined(separator: "")
      res.append(subStr)
      sp = ep
    }
    return res
  }
  
}
