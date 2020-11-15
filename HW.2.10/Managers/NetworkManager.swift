//
//  NetworkManager.swift
//  HW.2.10
//
//  Created by Сергей on 16.11.2020.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    func fetchImage(url: String) -> Data? {
        var result: Data?
        guard let url = URL(string: url) else { return nil }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                print(error)
                return
            }
            result = data
        }
        return result
    }
    
}


