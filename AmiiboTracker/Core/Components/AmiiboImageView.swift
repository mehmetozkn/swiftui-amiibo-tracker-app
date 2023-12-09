//
//  AmiiboImageView.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 9.12.2023.
//


import SwiftUI
import Kingfisher

struct AmiiboImageView: View {
    let imageUrl: String
    let width: CGFloat?
    let height: CGFloat?

    var body: some View {
        KFImage(URL(string: imageUrl))
            .resizable()
            .cornerRadius(AppConstants.Radius.cornerRadiusValue)
            .frame(width: width, height: height)
    }
}
