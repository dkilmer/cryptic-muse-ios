//
//  Combos.swift
//  CrypticMuse
//
//  Created by david kilmer on 6/16/16.
//  Copyright © 2016 david kilmer. All rights reserved.
//

class Combos {
  
  private class func iaol(len: Int) -> [Int] {
    var l : [Int] = []
    for _ in 0..<len {
      l.append(0)
    }
    return l
  }
  
  private class func fill(l: [Int], n: Int, w: Int, idx: Int, list: inout [[Int]]) {
    if (idx == 0) {
      for i in 0..<n-1 {
        var nl = iaol(len: w)
        nl[idx] = i
        fill(l: nl, n: n, w: w, idx: idx+1, list: &list)
      }
    } else {
      for i in l[idx-1]+1..<n {
        var nl = iaol(len: w)
        for j in 0..<idx {
          nl[j] = l[j]
        }
        nl[idx] = i
        if (idx == w-1) {
          list.append(nl)
        } else {
          fill(l: nl, n: n, w: w, idx: idx+1, list: &list)
        }
      }
    }
  }
  
  class func choose(items: Int, from: Int) -> [[Int]] {
    var list: [[Int]] = []
    if (items == 1) {
      for i in 0..<from {
        let nl = [i]
        list.append(nl)
      }
      return list
    }
    let na = iaol(len: items)
    fill(l: na, n: from, w: items, idx: 0, list: &list)
    return list
  }
  
}
