//
//  UsersTableViewCell.swift
//  Table-Research
//
//  Created by Ominext on 3/20/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import UIKit
import Alamofire
class UsersTableViewCell: UITableViewCell {

  @IBOutlet var avatarImage: UIImageView!
  @IBOutlet var userNameLabel: UILabel!
  @IBOutlet var scoreLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  func configureCell(user:UserEntity)  {
    
    Alamofire.request(user.avatar_url).responseData { (response) in
        if response.error == nil{
          print(response.result)
          if let data = response.data{
            DispatchQueue.main.async {
              self.avatarImage.image = UIImage(data: data)
              self.userNameLabel.text = user.login
              self.scoreLabel.text = String(user.score)

            }
          }
        }
      }

  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
