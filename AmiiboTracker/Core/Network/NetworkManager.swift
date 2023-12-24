//
//  NetworkManager.swift
//  AmiiboTracker
//
//  Created by Mehmet Macbook Pro on 25.12.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?{
        let request = AF.request(NetworkPath.getAll.rawValue, method: method)
            .validate()
            .serializingDecodable(T.self)
        
        let response = await request.response
        
        guard let value = response.value else {
            print("ERROR: \(String(describing: response.error))")
            return nil
        }
        return value
    }
}
