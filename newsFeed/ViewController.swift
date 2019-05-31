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
    
    let identyfire = "newsCell"
    var news: NewsDataModel?
    var myNews = [Mymodel]()
    var imageForPicture: UIImage?
    var urlGenerator = UrlGenerationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.searchBar.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let dvc = segue.destination as? DetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    dvc.article = myNews[indexPath.row]                    
                }
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        myNews[indexPath.row].isvisited = true
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "News Feed"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identyfire) as? OneTableViewCell else {
            return UITableViewCell()
        }
        cell.loadImage(imageUrl: myNews[indexPath.row].urlToImage)
        cell.titleLabel.text = myNews[indexPath.row].title 
        let hidden = myNews[indexPath.row].isvisited ? false : true
        cell.visitedLabel.isHidden = hidden
        return cell
    }
    func transformToModel() {
        myNews.removeAll()
        guard let articles = news?.articles else { return }
        for arcticle in articles {
            myNews.append(Mymodel(title: arcticle.title ?? "title",
                                  urlToImage: arcticle.urlToImage ?? "urlToImage",
                                  isvisited: false,
                                  publishedAt: arcticle.publishedAt ?? "publishedAt",
                                  description: arcticle.description ?? "description",
                                  url: arcticle.url))
        }
    }
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text, text.count >= 3, let url =  urlGenerator.generate(text: text)  {
            NetworkManager.getNews(requestUrl: url) { result in
                switch result {
                case .success(let json):
                    DispatchQueue.main.async {
                        self.news = json
                        self.transformToModel()
                        self.tableView.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        } else {
            self.news = nil
            self.tableView.reloadData()
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}



