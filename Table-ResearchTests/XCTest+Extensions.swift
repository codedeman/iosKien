//
//  XCTest+Extensions.swift
//  Table-ResearchTests
//
//  Created by Apple on 3/20/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import XCTest
import Mockingjay
extension XCTest{
  
  public func stub(urlString: String, jsonFileName: String) -> Mockingjay.Stub {
    let path = NSBundle(forClass: type(of: self)).pathForResource(jsonFileName, ofType: "json")!
    let data = NSData(contentsOfFile: path)!
    return stub(uri(urlString), builder: jsonData(data))
  }

  public func stub(urlString: String, error: NSError) -> Mockingjay.Stub {
    return stub(uri(urlString), builder: failure(error))
  }
}
