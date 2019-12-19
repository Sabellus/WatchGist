//
//  GistModel.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 18.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

struct Gist: Decodable {
    var description: String?
    var created_at: String?
    var updated_at: String?
    var html_url: String?
}
