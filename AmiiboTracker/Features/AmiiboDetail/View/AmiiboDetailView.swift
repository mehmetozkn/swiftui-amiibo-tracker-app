//
//  AmiiboDetailView.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import SwiftUI

struct AmiiboDetailView: View {
    @ObservedObject var viewModel = AmiiboViewModel()
    var amiibo: String

    var body: some View {
        VStack {
            if viewModel.isLoading {
                VStack {
                    AmiiboImageView(imageUrl: viewModel.amiibo?.first?.image ?? ""
                        , width: imageWidthSize, height: imageHeightSize)
                }

                Spacer()

                VStack (alignment: .leading) {
                    HStack {
                        Text("\(AppConstants.LocaleKeys.name): ")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.blue)

                        Text(viewModel.amiibo?.first?.name ?? AppConstants.LocaleKeys.noName)
                            .bold()
                            .font(.title2)

                    }

                    HStack {
                        Text("\(AppConstants.LocaleKeys.amiibosSeries):")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.blue)

                        Text(viewModel.amiibo?.first?.amiiboSeries ?? AppConstants.LocaleKeys.noSeries)
                            .bold()
                            .font(.title2)

                    }

                    HStack {
                        Text("\(AppConstants.LocaleKeys.type): ")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.blue)

                        Text(viewModel.amiibo?.first?.type ?? AppConstants.LocaleKeys.noType)
                            .bold()
                            .font(.title2)
                    }
                }
                Spacer()

            } else {
                CircularProgressView()
            }
        }
            .task {
            await viewModel.getAmiiboDetail(name: amiibo)
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
    AmiiboDetailView(viewModel: AmiiboViewModel(), amiibo: "sonic")
}
