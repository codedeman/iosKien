
//
//  UserListPresenter.swift
//  Table-Research
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import Foundation
import UIKit
class UserListPresenter: ViewToPresenterUserListProtocol {
  func showDetailController(navigationController: UINavigationController){
    router?.pushToUserDetail(navigationController: navigationController)
  }
  
  var view: PresenterToViewUserListProtocol?
  
  var interactor: PresenterToInteractorUserListProtocol?
  
  var router: PresenterToRouterUsersListProtocol?
  
  func fetchUsers() {
    print("Presenting...")
    interactor?.loadUser()
  }
  
  
}

extension UserListPresenter:InteractorToPresenterUserListPotocol{
  func usersSuccess(userList: Array<UserEntity>) {
    view?.onPostResponseSucces(usersList: userList)
  }
  
  func userFailed(err error:Error) {
    view?.onPostResponseFailed(error: error as! String)
  }
  
  
}
