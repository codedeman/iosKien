//
//  UserService.swift
//  Table-Research
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

let ApiBaseURl = "https://api.github.com/search/users?q="
let API_USER = "https://api.github.com/search/users?q=viettran"
typealias UserCallback = ([UserEntity]?) -> Void
typealias ErrorCallback = (Error) -> Void

protocol UserApiClient {
   func requestUserWithUsername(_ username: String,
   onSuccess: UserCallback?,
   onError: ErrorCallback?)
  func fetchUser(callBack: @escaping([UserEntity]?,Error?)-> Void)

}


class UserService: UserApiClient {
  func requestUserWithUsername(_ username: String, onSuccess: UserCallback?, onError: ErrorCallback?) {
    Alamofire.request(API_USER,method: HTTPMethod.get).responseJSON { (response) in
      switch response.result{
      case .success(_):
          do{
            DispatchQueue.global(qos: .background).async {
              let data = response.data
              let json = try? JSON(data!)
              let arrayResponse = json?["items"].arrayObject
              let arrayObject = Mapper<UserEntity>().mapArray(JSONArray: arrayResponse as! [[String : Any]])
              onSuccess!(arrayObject)
            }
            
          }catch{
            debugPrint(error.localizedDescription)
          }
        break
        
      case .failure(let err):
        onError!(err)
        
      }
      
    }
    
    
  }
  
 
  
  func fetchUser(callBack: @escaping ([UserEntity]?, Error?) -> Void) {
    Alamofire.request(API_USER,method: HTTPMethod.get).responseJSON { (response) in
      switch response.result{
      case .success(_):
        do{
          DispatchQueue.global(qos: .background).async {
            let data = response.data
            let json = try? JSON(data!)
            let arrayResponse = json?["items"].arrayObject
            
            let arrayObject = Mapper<UserEntity>().mapArray(JSONArray: arrayResponse as! [[String : Any]])
            callBack(arrayObject,nil)
          }
          
        }catch{
          debugPrint(error.localizedDescription)
        }
        break
      case .failure(_):
        callBack(nil,response.error)
        break
      default:
        callBack(nil,response.error)
      }
      
    }
  }
  

  
  
  
}

