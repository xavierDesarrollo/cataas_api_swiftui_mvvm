//
//  Constants.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import Foundation

struct Constants {
    struct ENDPOINT {
        static let url = "https://api.thecatapi.com/v1/breeds"
        static let vcaHospitalUrl = "https://vcahospitals.com/know-your-pet/cat-breeds"
        static let vetStreetUrl = "https://www.vetstreet.com/cats"
    }
    
    struct ERROR {
        static let generic = "Something went wrong."
        static let badResponse = "Bad response error with code: %@"
        static let badUrl = "Bad url error."
        static let parsing = "Parsing error."
        
    }
    
    struct TEXT {
        static let loading = "Loading data ..."
        static let retry = "Try again"
        static let error = "Error getting data."
        static let title = "Choose your cat"
        static let socialInfo = "Social Info"
        static let catInfo = "Cat Info"
        static let moreInfo = "More Info"
        static let energy = "Energy level"
        static let affection = "Affection level"
        static let shedding = "Shedding level"
        static let child = "Child Friendly"
        static let dog = "Dog Friendly"
        static let social = "Social Needs"
        static let adaptability = "Adaptability"
        static let intelligence = "Inteligence"
        static let hairless = "Is Hairless"
        static let hypo = "Is Hypoallergenic"
        static let short = "Is ShortLegs"
        static let moreInfoText = "For more information visit:"
        static let vcaAnimalHosp = "VCA Animal Hospitals"
        static let vetStreet = "VET Street"
    }
    
    struct APP {
        static let image = "https://cdn2.thecatapi.com/images/%@.jpg"
    }
    
    struct IMAGE {
        static let noImageCat = "noImageCat"
    }
    
    struct COLOR {
        static let energy = "#91c560"
    }
}
