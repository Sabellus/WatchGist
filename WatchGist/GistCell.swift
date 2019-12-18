//
//  GistCell.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 17.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import UIKit

class GistCell: UITableViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(timeLabel)
        
        self.addConstraints([
            NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: descriptionLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            
            NSLayoutConstraint(item: timeLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -16),
            NSLayoutConstraint(item: timeLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
