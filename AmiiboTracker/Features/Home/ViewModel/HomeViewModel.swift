//
//  HomeViewModel.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import Foundation

class HomeViewModel : ObservableObject {

    @Published var showAlert : Bool = false
    @Published var isLoading : Bool = false
    @Published var amiibos : [AmiiboModel]?
    
    @MainActor
    func getAmiibos() async {
        do {
            if let amiiobs = await NetworkManager.shared.fetch(path: .getAll, method: .get, type: AmiiboResponse.self) {
                self.amiibos = amiiobs.amiibo
                self.isLoading = true
            } else {
                self.showAlert = true
            }
        } 
    }
}
