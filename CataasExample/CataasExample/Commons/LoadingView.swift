//
//  LoadingView.swift
//  CataasExample
//
//  Created by Xavier Sotomayor on 26/8/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            ProgressView()
            Text(Constants.TEXT.loading)
                .foregroundColor(.gray)            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
