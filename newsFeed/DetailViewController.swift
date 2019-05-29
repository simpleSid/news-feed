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
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = loadImage(imageUrl: article?.urlToImage)
        detailImageView.image = image
        detailTitleLabel.text = article?.title
        detailDescriptionTextView.text = article?.description
        detailDateLabel.text = article?.publishedAt
    }

    func loadImage(imageUrl: String?) -> UIImage? {
        guard let imageURL = URL(string: imageUrl ?? "non"),
            let data = try? Data(contentsOf: imageURL) else { return UIImage(named: "defoltNewsImage")}
        return UIImage(data: data)
    }
}
