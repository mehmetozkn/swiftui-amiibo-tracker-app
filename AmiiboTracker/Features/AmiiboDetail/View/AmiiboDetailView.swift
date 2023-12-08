//
//  AmiiboDetailView.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import SwiftUI

struct AmiiboDetailView: View {
    @ObservedObject var viewModel = AmiiboViewModel(service: AmiiboDetailService())
    var amiiboName: String
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                Text(viewModel.amiibo?.first?.name ?? "No Name")
            } else {
                CircularProgressView()
            }
        }
        .task {
           await viewModel.getAmiibo(name: amiiboName)
        }
    }
}

#Preview {
    AmiiboDetailView(viewModel: AmiiboViewModel(service: AmiiboDetailService()), amiiboName: "sonic")
}
