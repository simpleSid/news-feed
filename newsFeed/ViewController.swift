//
//  ViewController.swift
//  newsFeed
//
//  Created by Денис Сидоренко on 27/05/2019.
//  Copyright © 2019 Денис Сидоренко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let arr = ["some text for article 1",
               "some text for article 2",
               "some text for article 3",
               "some text for article 4",
               "some text for article 5"]
    let identyfire = "newsCell"
    var news: NewsDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
        getRequest()
    }

    func getRequest() {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-04-27&sortBy=publishedAt&apiKey=b59bc1f13f884301a259ebc4a7c68af2"
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if let error = error {
                    print("error in the rask \(error.localizedDescription)")
                }
                if let data = data {
                    print(data)
                    do {
                        let json = try JSONDecoder().decode(NewsDataModel.self, from: data)
                        self.news = json
                    } catch {
                        print("error trying to convert data to JSON")
                        return
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }).resume()
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "News Feed"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identyfire) as? OneTableViewCell else {
            return UITableViewCell()
        }
        
        cell.newsImageView.image = UIImage(named: "defoltNewsImage")
        cell.titleLabel.text = news?.articles[indexPath.row].title
        cell.visitedLabel.text = "visited"
        
        return cell
    }
    
    
}
