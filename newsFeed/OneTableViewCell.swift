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

    func loadImage(imageUrl: String) {
        let imageManager = LoadImageManager()
        let proxy = Proxy(manager: imageManager)
        if let url = URL(string: imageUrl) {
            proxy.loadImage(url: url) { [weak self] (data, response, error) in
                guard let self = self else { return }
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        self.newsImageView.image = UIImage(named: "defoltNewsImage")
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.newsImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
