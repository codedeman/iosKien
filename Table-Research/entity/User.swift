//
//  User.swift
//  Table-Research
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import ObjectMapper

struct UserEntity:Mappable {
  
 private var login:String!
 private var avatar_url:String!
 private var score:Double!
  init?(map: Map) {
    mapping(map: map)
  }
  
  mutating func mapping(map: Map) {
    login <- map["login"]
    avatar_url <- map["avatar_url"]
    score <- map["score"]
  }
  
  
}
