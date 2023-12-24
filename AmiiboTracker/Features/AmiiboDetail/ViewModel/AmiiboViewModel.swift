//
//  AmiiboViewModel.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import Foundation

class AmiiboViewModel : ObservableObject {
    @Published var showAlert : Bool = false
    @Published var isLoading: Bool = false
    @Published var amiibo: [AmiiboDetailModel]?

    @MainActor
    func getAmiiboDetail(name: String) async {
        do {
            if let amiibo = await NetworkManager.shared.fetch(path: .getCustomAmiibo, method: .get, type: AmiiboDetailResponse.self) {
                self.amiibo = amiibo.amiibo
                isLoading = true
            } else {
                showAlert = true
            }
        }
    }
}
