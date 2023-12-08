//
//  AmiiboDetailModel.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import Foundation


struct AmiiboDetailModel: Codable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let head: String
    let image: String
    let name: String
    let tail: String
    let type: String
}

struct AmiiboDetailResponse : Codable {
    let amiibo : [AmiiboDetailModel]
}

