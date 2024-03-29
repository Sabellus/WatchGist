//
//  GistCell.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 17.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import UIKit

class GistCell: UITableViewCell {
    
    var descriptionText: String? {
        didSet {
            if let text = descriptionText {
                descriptionLabel.text = text
            }
        }
    }
    
    var timeCreatedText: String? {
        didSet {
            if let text = timeCreatedText {
                timeCreatedLabel.text = text
            }
        }
    }
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()    
    private let timeCreatedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(timeCreatedLabel)
        
        self.addConstraints([
            NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 8),
            NSLayoutConstraint(item: descriptionLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -16),
            
            NSLayoutConstraint(item: timeCreatedLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -16),
            NSLayoutConstraint(item: timeCreatedLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -8),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
