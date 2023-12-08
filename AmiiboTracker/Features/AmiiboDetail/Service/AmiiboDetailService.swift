//
//  AmiiboDetailService.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import Foundation
import Alamofire

class AmiiboDetailService {
    func fetchAmiiboDetail(name: String) async throws -> AmiiboDetailResponse {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(HttpPaths.getCustomAmiibo.rawValue + name, method: .get)
                .responseDecodable(of: AmiiboDetailResponse.self) { response in
                    switch response.result {
                    case .success(let amiiboDetail):
                        continuation.resume(returning: amiiboDetail)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
}
