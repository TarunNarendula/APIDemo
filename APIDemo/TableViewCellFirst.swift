//
//  TableViewCellFirst.swift
//  APIDemo
//
//  Created by Tarun on 4/27/18.
//  Copyright © 2018 Atirek Sharma. All rights reserved.
//

import UIKit

class TableViewCellFirst: UITableViewCell {

    @IBOutlet weak var labelID: UILabel!
    @IBOutlet weak var labelServiceName: UILabel!
    @IBOutlet weak var labelServiceId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
