//
//  ContentView.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    VStack {
                        List(viewModel.amiibos ?? [], id: \.name) { amiibo in
                            NavigationLink(destination: AmiiboDetailView(amiiboName: amiibo.name ?? "")) {
                                Text(amiibo.name ?? "No Name")
                            }
                        }

                    }
                    .navigationTitle("Amiibos")
                } else {
                    CircularProgressView()
                }
            }
        }
            .task {
            await viewModel.getAmiiboos()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: HomeService()))
}
