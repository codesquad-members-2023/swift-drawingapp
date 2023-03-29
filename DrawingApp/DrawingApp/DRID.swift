//
//  DRID.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/29.
//

import Foundation

struct DRID: Equatable, CustomStringConvertible {

  private let id: String
  
  init(id: String) {
    self.id = id
  }
  
  // MARK: Equatable
  
  static func == (lhs: DRID, rhs: DRID) -> Bool {
    lhs.id == rhs.id
  }
  
  // MARK: CustomStringConvertible
  
  var description: String {
    id
  }
  
  static func makeRandomID() -> String {
    let componentLength = [3, 3, 3]
    
    var tempID = UUID().uuidString
    var result: String = ""
    
    for (index, length) in componentLength.enumerated() {
      for _ in 0..<length {
        guard let char = tempID.popLast() else { break }
        result += String(char)
      }
      if index != componentLength.count - 1 { result.append("-") }
    }
    return result
  }
}
