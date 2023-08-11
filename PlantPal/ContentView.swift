//
//  PlantPalApp.swift
//  PlantPal
//
//  Created by Yash Kumar on 2023-08-01.
//

import CoreML
import PhotosUI
import SwiftUI

struct ContentView: View {
//    @State private var classificationLabel = ""

    @StateObject var imagePicker = ImagePicker()

//    let imageClassifier = try? ImageClassifierModel()

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [.green, Color(red: 0.6, green: 0.8, blue: 0.6)]),
                center: .center, startRadius: 2.0, endRadius: 600.0
            )
            .ignoresSafeArea()
            if imagePicker.image != nil {
                ImageView(userImage: imagePicker.image!, userUIImage: imagePicker.UserUIImage!)

            } else {
                VStack {
                    Spacer()

                    Image("final-image")
                        .resizable()
                        .frame(width: 240.0, height: 240.0)
                        .clipShape(RoundedRectangle(cornerRadius: 52))

                    Text("PlantPal").font(.title)
                    Text("by Yash Kumar").font(.caption)

                    //                if let image = imagePicker.image {
                    //                    image.resizable().scaledToFit()
                    //                }

                    //                Button("Classify") {
                    //                    classifyImage()
                    //                }

                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    PhotosPicker(
                        selection: $imagePicker.imageSelection,
                        matching: .images
                    ) {
                        //                        Button (action: {isShowingLoading = true}) {
                        //                            Text("Select Photo from Photos")
                        //                                .padding()
                        //                                .foregroundColor(.white)
                        //                                .background(Color.orange)
                        //                                .clipShape(RoundedRectangle(cornerRadius: 6))
                        //                        }

                        Text("Select Photo from Photos")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }

                    Spacer()

                    //                Text(classificationLabel)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
