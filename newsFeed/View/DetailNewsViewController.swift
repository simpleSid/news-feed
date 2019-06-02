//
//  DetailViewController.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 28/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import UIKit

class DetailNewsViewController: UIViewController {

    //Mark: View
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    @IBOutlet weak var detailPublisheadAtLabel: UILabel!
    @IBOutlet weak var detailUrlLabel: UILabel!
    
    var viewModel: DetailNewsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
    }
    
    //Mark: Methods
    func initialView() {
        guard let viewModel = viewModel else { return }
        detailTitleLabel.text = viewModel.title
        detailDescriptionTextView.text = viewModel.description
        detailPublisheadAtLabel.text = viewModel.publishedAt
        detailUrlLabel.text = viewModel.url
        getPhoto(viewModel)
    }
    
    fileprivate func getPhoto(_ viewModel: DetailNewsViewModel) {
        viewModel.loadImage { [weak self] (data, defoltName) in
            guard let self = self else { return }
            if let data = data {
                DispatchQueue.main.async {
                    self.detailImageView.image = UIImage(data: data)
                }
            } else if let defoltName = defoltName {
                DispatchQueue.main.async {
                    self.detailImageView.image = UIImage(named: defoltName)
                }
            }
        }
    }
}
