//
//  BreedRow.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            if breed.imageId != "" {
                AsyncImage(url: URL(string: String(format: Constants.APP.image, breed.imageId ?? ""))) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                            .cornerRadius(imageSize/2)
                        
                     } else if phase.error != nil {
                         Image(Constants.IMAGE.noImageCat)
                             .resizable()
                             .scaledToFill()
                             .frame(width: imageSize, height: imageSize)
                             .clipped()
                             .cornerRadius(imageSize/2)
                     } else {
                        ProgressView()
                             .frame(width: imageSize, height: imageSize)
                     }
                    
                }
            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.origin)
                    .font(.headline)
                    .foregroundColor(.gray)
                Text(breed.temperament)
                    .font(.footnote)
                    
            }
        }
     
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
