//
//  AmiiboViewModel.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import Foundation

class AmiiboViewModel : ObservableObject {
    private let service: AmiiboDetailService

    @Published var isLoading: Bool = false
    @Published var amiibo: [AmiiboDetailModel]?

    init(service: AmiiboDetailService) {
        self.service = service
    }

    @MainActor
    func getAmiibo(name: String) async {
        do {
            let response = try await service.fetchAmiiboDetail(name: name)
            self.amiibo = response.amiibo
            self.isLoading = true
        } catch {

        }
    }
}
