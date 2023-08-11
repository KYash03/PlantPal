//
//  PlantPalApp.swift
//  PlantPal
//
//  Created by Yash Kumar on 2023-08-01.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().scaleEffect(1.4).tint(Color.red)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
