//
//  NetworkError.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidData
}
