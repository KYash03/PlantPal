//
//  PlantPalApp.swift
//  PlantPal
//
//  Created by Yash Kumar on 2023-08-01.
//

import SwiftUI

struct ImageView: View {
    var userImage: Image
    var userUIImage: UIImage?

    @State private var isShowingLoading = false
    @State private var loadingTimer: Timer?
    @State private var selectAnotherPhoto = false
    @State private var isShowingResultView = false
    
    @State private var classificationLabel = ""
    let imageClassifier = try? ImageClassifierModel()

    var body: some View {
        if isShowingLoading {
            LoadingView()
                .onAppear {
                    loadingTimer = Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
                        isShowingLoading = false
                    }
                }
                .onDisappear {
                    loadingTimer?.invalidate()
                    loadingTimer = nil
                    isShowingResultView = true
                    
                }

        } else if isShowingResultView {
            ResultView(userImage: userImage, classificationLabel: classificationLabel)
        } else if selectAnotherPhoto {
            ContentView()
        } else {
            VStack {
                userImage
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 320, height: 600)
                    .clipped()

                Spacer()
                Spacer()

                HStack {
                    Button(action: { selectAnotherPhoto = true }) {
                        Text("Select Another Photo")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }

                    Button(action: {
                        classifyImage()
                        isShowingLoading = true
                    }) {
                        Text("Confirm")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
                }
                Spacer()
            }
        }
    }
    
    func classifyImage() {
        guard let image = userUIImage,
              let resizedImage = image.resizeImageTo(size: CGSize(width: 360, height: 360)),
              let buffer = resizedImage.convertToBuffer()
        else {
            return
        }

        let output = try? imageClassifier?.prediction(image: buffer)
        if let classificationLabelAsString = output?.target {
            classificationLabel = classificationLabelAsString
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(userImage: Image("lion-image"), userUIImage: UIImage(named: "random.png")!)
    }
}
