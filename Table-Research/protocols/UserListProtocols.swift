//
//  UserListProtocols.swift
//  Table-Research
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import UIKit
protocol ViewToPresenterUserListProtocol:class {
  var view:PresenterToViewUserListProtocol? {get set}
  var interactor:PresenterToInteractorUserListProtocol?{get set}
  var router: PresenterToRouterUsersListProtocol?{get set}
  func fetchUsers()
  func showDetailController(navigationController:UINavigationController)
  
  
}

protocol PresenterToRouterUsersListProtocol:class {
  static func createUsersListModule(userListRef: UserViewController)
  func pushToUserDetail(navigationController:UINavigationController)
  
}

protocol PresenterToViewUserListProtocol:class {
  
  func onPostResponseSucces(usersList: Array<UserEntity>)
  func onPostResponseFailed(error: String)
}


protocol PresenterToInteractorUserListProtocol:class {
  var presenter:InteractorToPresenterUserListPotocol? {get set}
  func loadUser()
  
  
}
protocol InteractorToPresenterUserListPotocol:class {
  
  func usersSuccess(userList:Array<UserEntity>)
  func userFailed(err:Error)
}
