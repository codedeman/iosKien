//
//  UserRouter.swift
//  Table-Research
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import UIKit

class UserListRouter:PresenterToRouterUsersListProtocol{
  func pushToUserDetail(navigationController: UINavigationController) {
    
  }
  
  class func createUsersListModule(userListRef: UserViewController) {
    
      let presenter:ViewToPresenterUserListProtocol & InteractorToPresenterUserListPotocol = UserListPresenter()
    
        userListRef.userPresenter = presenter
        userListRef.userPresenter?.router = UserListRouter()
        userListRef.userPresenter?.view = userListRef
        userListRef.userPresenter?.interactor = UserListInteractor(withApiWorker: UserService())
        userListRef.userPresenter?.interactor?.presenter = presenter
  }
  
  
  
}
