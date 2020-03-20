//
//  UserListInteractor.swift
//  Table-Research
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
class UserListInteractor: PresenterToInteractorUserListProtocol {
  var presenter: InteractorToPresenterUserListPotocol?
  var userApiWorker:UserApiClient?
  
  required init(withApiWorker userApiWorker:UserApiClient) {
    self.userApiWorker = userApiWorker
  }

  func loadUser() {
    
    userApiWorker?.requestUserWithUsername("kevin", onSuccess: ({ (userList) in
      
      self.presenter?.usersSuccess(userList: userList!)
      
    }), onError: { (err) in
      
        self.presenter?.userFailed(err: err)
    })
    

    

  }
  

  
  
}
