//
//  BreedView.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import SwiftUI

struct BreedView: View {
    
    @StateObject var breedViewModel = BreedViewModel()
    
    var body: some View {
      
        if breedViewModel.isLoading {
            LoadingView()
        } else if breedViewModel.errorMessage != nil  {
            ErrorView(breedViewModel: breedViewModel)
        } else {
            BreedListView(breeds: breedViewModel.breeds)
        }
    }
}

struct BreedView_Previews: PreviewProvider {
    static var previews: some View {
        BreedView()
    }
}
