//
//  HomeView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 16/02/24.
//

import SwiftUI

struct HomeView: View {
	@State private var selectedTab: BottomBarItensEnum = .pokedex
	
	var body: some View {
		
		if selectedTab == .pokedex {
			PokedexView()
		}
		
		if selectedTab == .regions {
			RegionsView()
		}
		
		if selectedTab == .favorities {
			FavoritiesView()
		}
		
		Spacer()
		
		BottomBarView(selectedTab: $selectedTab)
	}
}

#Preview {
	HomeView()
}
