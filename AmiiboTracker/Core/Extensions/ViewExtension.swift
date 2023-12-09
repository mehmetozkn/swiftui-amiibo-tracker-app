//
//  ViewExtension.swift
//  AmiiboTracker
//
//  Created by Mehmet Özkan on 8.12.2023.
//

import SwiftUI

extension View {
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
     var imageWidthSize: CGFloat {
        get { getScreenBounds().width * 0.3 }
    }

     var imageHeightSize: CGFloat {
        get { getScreenBounds().height * 0.2 }
    }
}
