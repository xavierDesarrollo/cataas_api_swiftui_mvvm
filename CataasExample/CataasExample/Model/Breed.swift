//
//  Breed.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import Foundation

struct Breed: Codable, CustomStringConvertible, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let origin: String
    let breedExplaination: String
    let imageId: String?
    let energyLevel: Int?
    let isHairless: Bool?
    let isShortLegs: Bool?
    let isHypoallergenic: Bool?
    let adaptability: Int?
    let affectionLevel: Int?
    let childFriendly: Int?
    let dogFriendly: Int?
    let intelligence: Int?
    let socialNeeds: Int?
    let sheddingLevel: Int?
    let vcahospitals: String?
    let vetstreet: String?
    
    var description: String {
        return ""
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case origin
        case breedExplaination = "description"
        case imageId = "reference_image_id"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
        case isShortLegs = "short_legs"
        case isHypoallergenic = "hypoallergenic"
        case adaptability
        case affectionLevel = "affection_level"
        case childFriendly = "child_friendly"
        case dogFriendly = "dog_friendly"
        case intelligence
        case socialNeeds = "social_needs"
        case sheddingLevel = "shedding_level"
        case vcahospitals = "vcahospitals_url"
        case vetstreet = "vetstreet_url"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        origin = try values.decode(String.self, forKey: .origin)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        imageId = try values.decodeIfPresent(String.self, forKey: .imageId)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        let shortLegs = try values.decode(Int.self, forKey: .isShortLegs)
        isShortLegs = shortLegs == 1
        let hypoallergenic = try values.decode(Int.self, forKey: .isHypoallergenic)
        isHypoallergenic = hypoallergenic == 1
        adaptability = try values.decode(Int.self, forKey: .adaptability)
        affectionLevel = try values.decode(Int.self, forKey: .affectionLevel)
        childFriendly = try values.decode(Int.self, forKey: .childFriendly)
        dogFriendly = try values.decode(Int.self, forKey: .dogFriendly)
        intelligence = try values.decode(Int.self, forKey: .intelligence)
        socialNeeds = try values.decode(Int.self, forKey: .socialNeeds)
        sheddingLevel = try values.decode(Int.self, forKey: .sheddingLevel)
        vcahospitals = try values.decodeIfPresent(String.self, forKey: .vcahospitals)
        vetstreet = try values.decodeIfPresent(String.self, forKey: .vetstreet)
    }
    
    init(name: String, id: String, explaination: String, temperament: String,
         energyLevel: Int, origin: String, isHairless: Bool, imageId: String?, isShortLegs: Bool?, isHypoallergenic: Bool?, adaptability: Int?, affectionLevel: Int?, childFriendly: Int?, dogFriendly: Int?, intelligence: Int?, socialNeeds: Int?, sheddingLevel: Int?, vcahospitals: String?, vetstreet: String?) {
        self.name = name
        self.id = id
        self.breedExplaination = explaination
        self.temperament = temperament
        self.energyLevel = energyLevel
        self.origin = origin
        self.isHairless = isHairless
        self.imageId = imageId
        self.isShortLegs = isShortLegs
        self.isHypoallergenic = isHypoallergenic
        self.adaptability = adaptability
        self.affectionLevel = affectionLevel
        self.childFriendly = childFriendly
        self.dogFriendly = dogFriendly
        self.intelligence = intelligence
        self.socialNeeds = socialNeeds
        self.sheddingLevel = sheddingLevel
        self.vcahospitals = vcahospitals
        self.vetstreet = vetstreet
    }
    
    static func example1() -> Breed {
        return Breed(name: "Prueba1", id: "1", explaination: "Prueba1", temperament: "Prueba1", energyLevel: 1, origin: "Prueba1", isHairless: true, imageId: "0XYvRd7oD", isShortLegs: true, isHypoallergenic: true, adaptability: 1, affectionLevel: 2, childFriendly: 3, dogFriendly: 3, intelligence: 2, socialNeeds: 1, sheddingLevel: 4, vcahospitals: "", vetstreet: "")
        
    }
    
    static func example2() -> Breed {
        return Breed(name: "Prueba2", id: "2", explaination: "Prueba2", temperament: "Prueba2", energyLevel: 3, origin: "Prueba2", isHairless: false, imageId: "NZpO4pU56M", isShortLegs: false, isHypoallergenic: false, adaptability: 1, affectionLevel: 2, childFriendly: 3, dogFriendly: 3, intelligence: 2, socialNeeds: 1, sheddingLevel: 4, vcahospitals: "", vetstreet: "")
    }
    
    static func noImageExample() -> Breed {
        return Breed(name: "Prueba3", id: "3", explaination: "Prueba3", temperament: "Prueba3", energyLevel: 5, origin: "Prueba3", isHairless: false, imageId: "O3btzLlsO", isShortLegs: true, isHypoallergenic: true, adaptability: 1, affectionLevel: 2, childFriendly: 3, dogFriendly: 3, intelligence: 2, socialNeeds: 1, sheddingLevel: 4, vcahospitals: "", vetstreet: "")
    }
}


