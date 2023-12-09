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
                            NavigationLink(destination: AmiiboDetailView(amiibo: amiibo.name ?? "")) {
                                HStack {
                                    AmiiboImageView(imageUrl: amiibo.image ?? "", width: imageWidthSize, height: imageHeightSize)

                                    VStack (alignment: .leading) {
                                        Text(amiibo.name ?? AppConstants.LocaleKeys.noName)
                                            .bold()
                                            .font(.title2)
                                            .foregroundStyle(.blue)

                                        Text(amiibo.gameSeries ?? "")
                                    }
                                        .padding()

                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                    }
                    .navigationTitle(AppConstants.LocaleKeys.amiibosTitle)
                } else {
                    CircularProgressView()
                }
            }
        }
            .task {
            await viewModel.getAmiiboos()
        }
            .alert(isPresented: Binding(
                get: { viewModel.showAlert },
                set: { _ in }
            )) {
                Alert(
                    title: Text(AppConstants.LocaleKeys.error),
                    message: Text(AppConstants.LocaleKeys.tryAgain),
                    dismissButton: .default(Text(AppConstants.LocaleKeys.okey)) {
                    }
                )
            }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(service: HomeService()))
}
