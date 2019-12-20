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
        label.numberOfLines = 0
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
    let htmlUrlButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionOpenLink), for: .touchUpInside)
        return button
    }()
    let btLinkAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 14),
        .foregroundColor: UIColor.blue,
        .underlineStyle: NSUnderlineStyle.single.rawValue]
    
    var url = ""
    
    var presenter: DetailGistPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        presenter.setGist()
    }
    @objc func actionOpenLink() {
        guard let url = URL(string: url) else {
             return
         }
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                if UIApplication.shared.canOpenURL(url) {
                   UIApplication.shared.openURL(url)
                }
            }
        }
    }
    func setupViews() {
        view.addSubview(descriptionLabel)
        view.addSubview(timeCreatedLabel)
        view.addSubview(timeUpdatedLabel)
        view.addSubview(htmlUrlButton)
        
        view.addConstraints([
            NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 100),
            NSLayoutConstraint(item: descriptionLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -16),
            
            NSLayoutConstraint(item: htmlUrlButton, attribute: .top, relatedBy: .equal, toItem: descriptionLabel, attribute: .bottom, multiplier: 1.0, constant: 8),
            NSLayoutConstraint(item: htmlUrlButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: htmlUrlButton, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -16),

            NSLayoutConstraint(item: timeCreatedLabel, attribute: .top, relatedBy: .equal, toItem: htmlUrlButton, attribute: .bottom, multiplier: 1.0, constant: 8),
            NSLayoutConstraint(item: timeCreatedLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 16),

            NSLayoutConstraint(item: timeUpdatedLabel, attribute: .top, relatedBy: .equal, toItem: timeCreatedLabel, attribute: .bottom, multiplier: 1.0, constant: 8),
            NSLayoutConstraint(item: timeUpdatedLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 16),
            ])
    }
    
}

extension DetailGistViewController: DetailGistViewProtocol {
    func setGist(gist: Gist?) {
        descriptionLabel.text = gist?.description
        timeCreatedLabel.text = "Created " + (gist?.created_at?.getFormattedDate() ?? "")
        timeUpdatedLabel.text = "Updated " + (gist?.updated_at?.getFormattedDate() ?? "")
        htmlUrlButton.setAttributedTitle(NSMutableAttributedString(string: gist?.html_url ?? "https://www.google.com/",
        attributes: btLinkAttributes), for: .normal)
        url = gist?.html_url ?? "https://www.google.com/"
    }    
}
