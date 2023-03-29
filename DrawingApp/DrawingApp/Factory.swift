//
//  Factory.swift
//  DrawingApp
//
//  Created by Effie on 2023/03/30.
//

import Foundation

protocol Factory {
  associatedtype Product
  
  func produce() -> Product?
}
