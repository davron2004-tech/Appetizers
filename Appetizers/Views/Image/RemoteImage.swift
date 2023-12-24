//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI
import Observation

@Observable final class ImageLoader{
    var image: Image? = nil
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImages(fromURLString: urlString) { image in
            guard let uiImage = image else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
        
    }
}

struct AppetizerRemoteImage: View{
    
    var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        VStack{
            imageLoader.image?.resizable() ?? Image("food-placeholder").resizable()
        }
        .onAppear{
            imageLoader.load(fromURLString: urlString)
        }
        
            
    }
}
