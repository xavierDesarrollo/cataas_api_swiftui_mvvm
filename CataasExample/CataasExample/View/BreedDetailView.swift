//
//  BreedDetailView.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import SwiftUI

struct BreedDetailView: View {
    
    let breed: Breed
    let imageSize: CGFloat = 300
    
    var body: some View {
        ScrollView {
            VStack {
                if breed.imageId != "" {
                    AsyncImage(url: URL(string: String(format: Constants.APP.image, breed.imageId ?? ""))) { phase in
                        if let image = phase.image {
                            image.resizable()
                                .scaledToFit()
                                .frame( height: imageSize)
                                .clipped()
                                .cornerRadius(10)
                            
                        } else if phase.error != nil {
                            Image(Constants.IMAGE.noImageCat)
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageSize, height: imageSize)
                                .clipped()
                                .cornerRadius(10)
                        } else {
                            ProgressView()
                                .frame(width: imageSize, height: imageSize)
                        }                        
                    }
                }else {
                    Color.gray.frame(height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(breed.name)
                        .font(.headline)
                    Text(breed.temperament)
                        .font(.footnote)
                    Text(breed.breedExplaination)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    
                    HStack {
                        VStack { Divider().background(.separator) }.padding(20)
                        Text(Constants.TEXT.socialInfo).font(.footnote)
                        VStack { Divider().background(.separator) }.padding(20)
                    }
                                        
                    HStack {
                        Text(Constants.TEXT.energy)
                            .font(.footnote)
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.energyLevel ?? 0 >= id ? Color.green : Color.gray)
                        }
                    }
                    
                    HStack {
                        Text(Constants.TEXT.affection)
                            .font(.footnote)
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.affectionLevel ?? 0 >= id ? Color.green : Color.gray)
                        }
                    }
                    
                    HStack {
                        Text(Constants.TEXT.shedding)
                            .font(.footnote)
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.sheddingLevel ?? 0 >= id ? Color.green : Color.gray)
                        }
                    }
                    
                    HStack {
                        Text(Constants.TEXT.child)
                            .font(.footnote)
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.childFriendly ?? 0 >= id ? Color.blue : Color.gray)
                        }
                    }
                    
                    HStack {
                        Text(Constants.TEXT.dog)
                            .font(.footnote)
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.dogFriendly ?? 0 >= id ? Color.blue : Color.gray)
                        }
                    }
                    
                    HStack {
                        Text(Constants.TEXT.social)
                            .font(.footnote)
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.socialNeeds ?? 0 >= id ? Color.blue : Color.gray)
                        }
                    }
                    
                    HStack {
                        Text(Constants.TEXT.adaptability)
                            .font(.footnote)
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.adaptability ?? 0 >= id ? Color.mint : Color.gray)
                        }
                    }
                    
                    HStack {
                        Text(Constants.TEXT.intelligence)
                            .font(.footnote)
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "circle.fill")
                                .foregroundColor(breed.intelligence ?? 0 >= id ? Color.mint : Color.gray)
                        }
                    }
                    
                    HStack {
                        VStack { Divider().background(.separator) }.padding(20)
                        Text(Constants.TEXT.catInfo).font(.footnote)
                        VStack { Divider().background(.separator) }.padding(20)
                    }
                    
                    Toggle(Constants.TEXT.hairless, isOn: .constant(breed.isHairless ?? false))
                        .font(.footnote)
                        .toggleStyle(SwitchToggleStyle(tint: .orange))                        
                    Toggle(Constants.TEXT.hypo, isOn: .constant(breed.isHypoallergenic ?? false))
                        .font(.footnote)
                        .toggleStyle(SwitchToggleStyle(tint: .orange))
                    Toggle(Constants.TEXT.short, isOn: .constant(breed.isShortLegs ?? false))
                        .font(.footnote)
                        .toggleStyle(SwitchToggleStyle(tint: .orange))
                    
                    HStack {
                        VStack { Divider().background(.separator) }.padding(20)
                        Text(Constants.TEXT.moreInfo).font(.footnote)
                        VStack { Divider().background(.separator) }.padding(20)
                    }
                    
                    Text(Constants.TEXT.moreInfoText)
                        .font(.headline)
                    
                    Link(destination: (URL(string: breed.vcahospitals ?? Constants.ENDPOINT.vcaHospitalUrl)) ?? URL(fileURLWithPath: ""), label: {
                        Text(Constants.TEXT.vcaAnimalHosp)
                            .font(.footnote)
                            .frame(alignment: .center)
                    })
                    
                    Link(destination: (URL(string: breed.vetstreet ?? Constants.ENDPOINT.vetStreetUrl)) ?? URL(fileURLWithPath: ""), label: {
                        Text(Constants.TEXT.vetStreet)
                            .font(.footnote)
                            .frame(alignment: .center)
                    })
                    
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.noImageExample())
    }
}


