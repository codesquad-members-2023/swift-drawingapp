//
//  PlaneTests.swift
//  PlaneTests
//
//  Created by Effie on 2023/04/10.
//

import XCTest

final class PlaneTests: XCTestCase {
  
  var sut: Plane!
  
  var dummyRect: Rectangle!
  var dummy10x10Rectangle: Rectangle!
  var pointAvailableIn10x10Rectangle: Point!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = Plane(size: Size(width: 100, height: 100))
    
    dummyRect = Rectangle(
      id: ID(id: ""),
      size: Size(width: 0, height: 0),
      origin: Point(x: 0, y: 0),
      backgroundColor: Color(r: 0, g: 0, b: 0, alpha: .level1))
    
    let size = Size(width: 10, height: 10)
    let point = Point(x: 0, y: 0)
    dummy10x10Rectangle = Rectangle(
      id: ID(id: ""),
      size: size,
      origin: point,
      backgroundColor: Color(r: 0, g: 0, b: 0, alpha: .level1))
    
    pointAvailableIn10x10Rectangle = Point(x: 5, y: 5)
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func test_count_Plane이비어있을때_conut가0인지() throws {
    XCTAssertEqual(sut.count, 0)
  }
  
  func test_add_한번호출했을때_count가1인지() throws {
    sut.add(rect: dummyRect)
    
    XCTAssertEqual(sut.count, 1)
  }
  
  func test_subscript_음수를전달했을때_Nil을리턴하는지() throws {
    let index = -1
    let target = sut[index]
    
    XCTAssertNil(target)
  }
  
  func test_subscript_배열이비었을때_인덱스를전달하면_Nil을리턴하는지() throws {
    let index = 0
    let target = sut[index]
    
    XCTAssertNil(target)
  }
  
  func test_subscript_사각형을1개추가했을때_인덱스0을전달하면_Nil이아닌지() throws {
    sut.add(rect: dummyRect)
    
    let index = 0
    let target = sut[index]
    
    XCTAssertNotNil(target)
  }
  
  func test_getRectangles_유효하지않은좌표를전달하면_빈배열을리턴하는지() throws {
    let size = Size(width: 10, height: 10)
    sut = Plane(size: size)
    
    let targetPoint = Point(x: 50, y: 50)
    let rects = sut.getRectangles(on: targetPoint)
    
    XCTAssertEqual(rects.count, 0)
  }
  
  func test_getRectangles_사각형내부좌표를전달하면_비어있지않은배열을리턴하는지() throws {
    let size = Size(width: 10, height: 10)
    let point = Point(x: 0, y: 0)
    let newRect = Rectangle(
      id: ID(id: ""),
      size: size,
      origin: point,
      backgroundColor: Color(r: 0, g: 0, b: 0, alpha: .level1))
    sut.add(rect: newRect)
    
    let targetPoint = Point(x: 5, y: 5)
    guard newRect.areaContains(targetPoint) else { return }
    let rects = sut.getRectangles(on: targetPoint)
    
    XCTAssertGreaterThanOrEqual(rects.count, 1)
  }
  
  func test_getRectangles_5개사각형에해당되는좌표를전달하면_5개짜리배열을리턴하는지() throws {
    let count = 5
    (0 ..< count).forEach { _ in sut.add(rect: dummy10x10Rectangle) }
    
    let rects = sut.getRectangles(on: pointAvailableIn10x10Rectangle)
    
    XCTAssertEqual(rects.count, count)
    
  }
}
