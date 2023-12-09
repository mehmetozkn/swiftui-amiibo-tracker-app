//
//  AmiiboDetailView.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import SwiftUI

struct AmiiboDetailView: View {
    @ObservedObject var viewModel = AmiiboViewModel(service: AmiiboDetailService())
    var amiibo: String
    
    private var imageWidthSize: CGFloat {
        get { getScreenBounds().width * 0.4 }
    }
    
    private var imageHeightSize: CGFloat {
        get { getScreenBounds().height * 0.3 }
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                VStack {
                    AmiiboImageView(imageUrl: viewModel.amiibo?.first?.image ?? ""
                                    ,width: imageWidthSize,height: imageHeightSize)
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    HStack {
                        Text("Name: ")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.blue)
                        
                        Text(viewModel.amiibo?.first?.name ?? "No Name")
                            .bold()
                            .font(.title2)

                    }
                    
                    HStack {
                        Text("Amiibo Series: ")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.blue)
                        
                        Text(viewModel.amiibo?.first?.amiiboSeries ?? "No Series")
                            .bold()
                            .font(.title2)

                    }
                    
                    HStack {
                        Text("Type: ")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.blue)
                        
                        Text(viewModel.amiibo?.first?.type ?? "No Type")
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
           await viewModel.getAmiibo(name: amiibo)
        }
    }
}

#Preview {
    AmiiboDetailView(viewModel: AmiiboViewModel(service: AmiiboDetailService()), amiibo: "sonic")
}
