//
//  BreedViewModel.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import SwiftUI

class BreedViewModel: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: ServiceProtocol
    
    init(service: ServiceProtocol = Service()) {
        self.service = service
        getBreedData()
    }
    
    func getBreedData() {
        isLoading = true
        errorMessage = nil
        
        service.getBreeds() { [unowned self] result in
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    case .success(let breeds):
                        self.breeds = breeds
                }
            }
        }
    }
}
