//
//  OneTableViewCell.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 28/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import UIKit

class OneTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitedLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
