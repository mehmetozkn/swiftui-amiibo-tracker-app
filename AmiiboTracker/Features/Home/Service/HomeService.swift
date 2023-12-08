//
//  HomeService.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import SwiftUI
import Alamofire

class HomeService {
    func fetchAmiibos() async throws -> [AmiiboModel] {        
        guard let url = URL(string: HttpPaths.getAll.rawValue) else {
            print("Invalid uRL")
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(AmiiboResponse.self, from: data)
            return Array(response.amiibo)
        } catch {
            print("Request Failed")
            throw NetworkError.requestFailed
        }
    }
}
