//
//  ServiceProtocol.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import Foundation


protocol ServiceProtocol {
    func getBreeds(completion: @escaping(Result<[Breed], ServiceError>) -> Void)
}
