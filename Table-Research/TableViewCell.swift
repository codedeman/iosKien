//
//  TableViewCell.swift
//  Table-Research
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//

import UIKit
import AlamofireImage
class TableViewCell: UITableViewCell {

  @IBOutlet var mainImage: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  override func prepareForReuse() {
    super.prepareForReuse()
     mainImage.af_cancelImageRequest()
//    mainImage
    
  }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
