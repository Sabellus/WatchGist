//
//  DetailGistViewController.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 19.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import UIKit

class DetailGistViewController: UIViewController {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    let timeCreatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    let timeUpdatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    let htmlUrlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    
    var presenter: DetailGistPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter.setGist()
    }
    func setupViews() {
        view.addSubview(descriptionLabel)
        view.addSubview(timeCreatedLabel)
        view.addSubview(timeUpdatedLabel)
        view.addSubview(htmlUrlLabel)
        
        view.addConstraints([
            NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 100),
            NSLayoutConstraint(item: descriptionLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -16),

            NSLayoutConstraint(item: htmlUrlLabel, attribute: .top, relatedBy: .equal, toItem: descriptionLabel, attribute: .bottom, multiplier: 1.0, constant: 8),
            NSLayoutConstraint(item: htmlUrlLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 16),

            NSLayoutConstraint(item: timeCreatedLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -16),
            NSLayoutConstraint(item: timeCreatedLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -24),

            NSLayoutConstraint(item: timeUpdatedLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: timeUpdatedLabel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -24),
            ])
    }
}

extension DetailGistViewController: DetailGistViewProtocol {
    func setGist(gist: Gist?) {
        descriptionLabel.text = gist?.description
        timeCreatedLabel.text = gist?.created_at
        timeUpdatedLabel.text = gist?.updated_at
        htmlUrlLabel.text = gist?.html_url
    }    
}
