//
//  OneTableViewCell.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 28/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // Mark: View
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visitedLabel: UILabel!
    
    var viewModel: TableViewCellViewModel? {
        didSet {
            initialisationCel()
        }
    }
    
    // Mark: Methods
    func initialisationCel() {
        guard let viewModel = viewModel else { return }
        initialVisualCell()
        titleLabel.text = viewModel.title
        let hidden = viewModel.visited ? false : true
        visitedLabel.isHidden = hidden
        getPhoto(viewModel)
    }
    
    func initialVisualCell() {
        newsImageView.layer.cornerRadius = newsImageView.frame.width / 2
    }
    
    private func getPhoto(_ viewModel: TableViewCellViewModel) {
        viewModel.loadImage { [weak self] (data, defoltName) in
            guard let self = self else { return }
            if let data = data {
                DispatchQueue.main.async {
                    self.newsImageView.image = UIImage(data: data)
                }
            } else if let defoltName = defoltName {
                DispatchQueue.main.async {
                    self.newsImageView.image = UIImage(named: defoltName)
                }
            }
        }
    }
}
