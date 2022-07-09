//
//  LoadingView.swift
//  Storm
//
//  Created by Abhirath Sujith on 09/07/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame( maxWidth: .infinity,  maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
