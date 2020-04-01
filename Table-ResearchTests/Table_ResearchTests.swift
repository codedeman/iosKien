//
//  Table_ResearchTests.swift
//  Table-ResearchTests
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import XCTest
import Mockingjay
@testable import Table_Research

class Table_ResearchTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension XCTest{
  public func stub(urlString: String, jsonFileName: String) -> Mockingjay.Stub {
    let path = Bundle(for: type(of: self)).path(forResource: jsonFileName, ofType: "json")!
    let data = NSData(contentsOfFile: path)!
    return stub(uri(urlString), jsonData(data as Data))
  }

  public func stub(urlString: String, error: NSError) -> Mockingjay.Stub {
    return stub(uri(urlString), failure(error))
  }

}
