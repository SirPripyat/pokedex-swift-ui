//
//  PokedexView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 14/02/24.
//

import SwiftUI

struct PokedexView: View {
	@State private var selectedTab: BottomBarItensEnum = .pokedex
	
	var body: some View {
		VStack {
			SearchBarView()
		}
		.navigationBarHidden(true)
		
	}
	
}

#Preview {
	PokedexView()
}
