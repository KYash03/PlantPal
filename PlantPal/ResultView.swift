//
//  ResultView.swift
//  PlantPal
//
//  Created by Yash Kumar on 2023-08-11.
//

import SwiftUI

struct ResultView: View {
    @State var userImage: Image
    @State var classificationLabel: String
    @State var selectNewPicture = false
    
    
    var body: some View {
        if (selectNewPicture) {
            ContentView()
        } else {
            VStack {
                userImage
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 320, height: 600)
                    .clipped()
                Text(classificationLabel)
                Spacer()
                Button (action: {
                    selectNewPicture = true
                }) {
                    Text("Start Over")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                
                Spacer()
                Spacer()
            }

        }
    }
    
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(userImage: Image("lion-image") ,classificationLabel: "Apple")
    }
}
