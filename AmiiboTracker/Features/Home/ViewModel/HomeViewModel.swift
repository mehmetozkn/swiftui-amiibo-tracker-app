//
//  HomeViewModel.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import Foundation

class HomeViewModel : ObservableObject {
    private let service : HomeService

    @Published var showAlert : Bool = false
    @Published var isLoading : Bool = false
    @Published var amiibos : [AmiiboModel]?
    
    init(service: HomeService) {
        self.service = service
    }
        
    @MainActor
     func getAmiiboos() async {
        do {
            self.amiibos = try await service.fetchAmiibos()
            self.isLoading = true
        } catch {
            self.showAlert = true
        }
    }
}
