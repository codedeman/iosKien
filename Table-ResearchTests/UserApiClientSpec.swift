//
//  UserApiClientSpec.swift
//  Table-ResearchTests
//
//  Created by Apple on 3/21/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import XCTest
import Nimble
import Mockingjay
import Quick
@testable import Table_Research

class UserApiClientSpec: QuickSpec {
  var userApiWorker:UserApiClient?

  override func spec() {
    
    super.spec()
    describe("requestUserWithLoginName") {
      
      var returnedUserData:[UserEntity]?
      var returnedError:Error?
      let urlString = "https://api.github.com/search/users?q=kevin"
      
      beforeEach {
        returnedError = nil
        returnedError = nil
      }
      
      context("success") {
        beforeEach {
          self.stub(urlString: urlString, jsonFileName: "GetUserSuccess")
          self.userApiWorker?.requestUserWithUsername("kevin", onSuccess: { (userData) in
              returnedUserData = userData
            print("user data \(String(describing: returnedUserData))")
          }, onError: nil)
        }
        it("returns UserData"){
          expect(returnedUserData).toEventuallyNot(beNil(),timeout: 50)
          print("number data \(String(describing: returnedUserData?.count))")
          for user in returnedUserData!{
            expect(user.login) == "kevin"
            expect(user.score) == 1.0
          }
        }
      }
      
      context("error") {
          let error = NSError(domain: "error", code: 404, userInfo: nil)
        beforeEach {
          self.stub(urlString: urlString, error: error)
          self.userApiWorker?.requestUserWithUsername("kevin", onSuccess: nil, onError: { (error) in
            
            returnedError = error
          })
        }
      }
    }
  }
    

}
