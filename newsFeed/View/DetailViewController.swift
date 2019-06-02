//
//  DetailViewController.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 28/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionTextView: UITextView!
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailUrlLabel: UILabel!
    
    var article: NewsWorkModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let article = self.article {
            detailTitleLabel.text = article.title
            detailDescriptionTextView.text = article.description
            detailDateLabel.text = article.publishedAt
            detailUrlLabel.text = article.url
            loadImage(imageUrl: article.urlToImage)
        }
    }
    
    func loadImage(imageUrl: String) {
        let imageManager = LoadImageManager()
        let proxy = Proxy(manager: imageManager)
        if let url = URL(string: imageUrl) {
            proxy.loadImage(url: url) { [weak self] (data, response, error) in
                guard let self = self else { return }
                guard let data = data, error == nil else {
                    DispatchQueue.main.async {
                        self.detailImageView.image = UIImage(named: "defoltNewsImage")
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.detailImageView.image = UIImage(data: data)
                }
            }
        }
    }
}
