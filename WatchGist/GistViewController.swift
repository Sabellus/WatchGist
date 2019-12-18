//
//  ViewController.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 17.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import UIKit

struct Gist {
    var description: String
    var createdAt: String
    var updatedAt: String
    var htmlUrl: String
}
class GistViewController: UIViewController {

    private let gists = [
        Gist(description: "First", createdAt: "1", updatedAt: "11", htmlUrl: "https//1"),
        Gist(description: "Secound", createdAt: "2", updatedAt: "22", htmlUrl: "https//2"),
        Gist(description: "Third", createdAt: "3", updatedAt: "33", htmlUrl: "https//3")
    ]
    
    private var tableView: UITableView =  {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Gists"
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        tableView.register(GistCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(tableView)
        view.addConstraints([
            NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0),
        ])
     }
 }
extension GistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GistCell
       cell.descriptionLabel.text = gists[indexPath.row].description
       cell.timeLabel.text = gists[indexPath.row].createdAt
        return cell
    }
}
extension GistViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
    }
}
