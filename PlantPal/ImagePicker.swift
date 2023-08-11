//
//  PlantPalApp.swift
//  PlantPal
//
//  Created by Yash Kumar on 2023-08-01.
//

import PhotosUI
import SwiftUI

@MainActor
class ImagePicker: ObservableObject {
    @Published var image: Image?
    @Published var UserUIImage: UIImage?

    @Published var imageSelection: PhotosPickerItem? {
        didSet {
            if let imageSelection {
                Task {
                    try await loadTransferable(from: imageSelection)
                }
            }
        }
    }

    func loadTransferable(from imageSelection: PhotosPickerItem?) async throws {
        do {
            if let data = try await imageSelection?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    UserUIImage = uiImage
                    image = Image(uiImage: uiImage)
                }
            }
        } catch {
            image = nil
        }
    }
}
