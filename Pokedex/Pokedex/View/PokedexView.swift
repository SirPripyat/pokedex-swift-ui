//
//  PokedexView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 14/02/24.
//

import SwiftUI

struct PokedexView: View {
	var body: some View {
		
		VStack {
			SearchBarView()
			Spacer()
			BottomBarView()
		}
		.navigationBarHidden(true)
		
	}
		
}

#Preview {
    PokedexView()
}
