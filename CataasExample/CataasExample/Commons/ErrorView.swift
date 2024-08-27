//
//  ErrorView.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import Foundation

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var breedViewModel: BreedViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text(breedViewModel.errorMessage ?? Constants.TEXT.error)
            Button {
                breedViewModel.getBreedData()
            } label: {
                Text(Constants.TEXT.retry)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedViewModel: BreedViewModel())
    }
}
