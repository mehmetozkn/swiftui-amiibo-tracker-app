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
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(HttpPaths.getAll.rawValue, method: .get)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            let amiiboResponse = try JSONDecoder().decode(AmiiboResponse.self, from: data)
                            continuation.resume(returning: Array(amiiboResponse.amiibo))
                        } catch {
                            continuation.resume(throwing: NetworkError.requestFailed)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
