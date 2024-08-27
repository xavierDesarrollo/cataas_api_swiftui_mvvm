//
//  BreedListView.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import SwiftUI

struct BreedListView: View {
    let breeds: [Breed]
    
    @State private var searchText: String = ""
    
    var filteredBreeds: [Breed] {
        if searchText.count == 0 {
          return breeds
        } else {
            return breeds.filter {
                $0.name.lowercased().contains(searchText.lowercased()) ||
                $0.origin.lowercased().contains(searchText.lowercased())                
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBreeds) { breed in
                    NavigationLink {
                        BreedDetailView(breed: breed)
                    } label: {
                        BreedRow(breed: breed)
                    }                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(Constants.TEXT.title)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [Breed.example1(), Breed.example2(), Breed.noImageExample()])
    }
}
