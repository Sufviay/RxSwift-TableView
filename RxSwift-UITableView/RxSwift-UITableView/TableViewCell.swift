//
//  TableViewCell.swift
//  RxSwift-UITableView
//
//  Created by 岁变 on 2017/7/10.
//  Copyright © 2017年 岁变. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var user: User? {
        willSet {
            let string = "\(newValue!.screenName)在简书上关注了\(newValue!.followingCount)个用户，并且\(newValue!.followersCount)个用户关注了"
            backgroundColor = tag % 2 == 0 ? UIColor.lightGray : UIColor.white
            textLabel?.text = string
            textLabel?.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
