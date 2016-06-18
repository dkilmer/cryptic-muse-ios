//
//  CalcWord.swift
//  CrypticMuse
//
//  Created by david kilmer on 6/16/16.
//  Copyright © 2016 david kilmer. All rights reserved.
//

class CalcWord {
  var text: String
  var strip: String
  var letters: [Int]
  var words: [String]

  required init(withText: String, andStrip: String) {
    text = withText
    strip = andStrip
    words = []
    letters = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    reset(doZero: false)
  }
  
  func reset(doZero: Bool) {
    if (doZero) {
      for i in 0..<letters.count {
        letters[i] = 0
      }
    }
    for c in strip.unicodeScalars {
      if (c.value >= 97 && c.value <= 122) {
        letters[Int(c.value) - 97] += 1
      }
    }
  }
  
  func contains(word: CalcWord) -> Bool {
    for i in 0..<letters.count {
      if (letters[i] < word.letters[i]) {
        return false
      }
    }
    return true
  }
  
  func subtract(word: CalcWord) {
    for i in 0..<letters.count {
      letters[i] -= word.letters[i]
    }
    words.append(word.text)
  }
  
  func empty() -> Bool {
    for i in 0..<letters.count {
      if (letters[i] > 0) {
        return false
      }
    }
    return true
  }
  
  func clone() -> CalcWord {
    let cw = CalcWord(withText: text, andStrip: strip)
    for i in 0..<letters.count {
      cw.letters[i] = letters[i]
    }
    for wrd in words {
      cw.words.append(wrd)
    }
    return cw
  }
  
}
