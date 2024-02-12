//
//  SplashView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 11/02/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
      ZStack {
        Color("bluescale-100")
        Image("pokedexLogo")
      }.ignoresSafeArea()
        
    }
}

#Preview {
    SplashView()
}
