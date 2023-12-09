//
//  ContentView.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    private var imageWidthSize: CGFloat {
        get { getScreenBounds().width * 0.3 }
    }
    
    private var imageHeightSize: CGFloat {
        get { getScreenBounds().height * 0.2 }
    }

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    VStack {
                        List(viewModel.amiibos ?? [], id: \.name) { amiibo in
                            NavigationLink(destination: AmiiboDetailView(amiiboName: amiibo.name ?? "")) {
                                HStack {
                                    AmiiboImageView(imageUrl: amiibo.image ?? "" ,width: imageWidthSize, height: imageHeightSize)
                                
                                    VStack (alignment: .leading) {
                                        Text(amiibo.name ?? "No Name")
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
