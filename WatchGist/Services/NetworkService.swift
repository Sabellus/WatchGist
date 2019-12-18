//
//  NetworkService.swift
//  WatchGist
//
//  Created by Савелий Вепрев on 18.12.2019.
//  Copyright © 2019 Савелий Вепрев. All rights reserved.
//

import Foundation


protocol NetworkServiceProtocol {
    func getGists(page: Int, perPage: Int, completion: @escaping (Result<[Gist]?, Error>) -> Void )
}
class NetworkService: NetworkServiceProtocol {
    func getGists(page: Int, perPage: Int, completion: @escaping (Result<[Gist]?, Error>) -> Void) {
        let urlString = "https://api.github.com/gists/public" + "?page=" + String(page) + "&" + "per_page=" + String(perPage)
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            do {
                guard let dataJson = data else { return }
                let object = try JSONDecoder().decode([Gist].self, from: dataJson)
                completion(.success(object))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
