//
//  SearchBarView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 14/02/24.
//

import SwiftUI

struct SearchBarView: View {
	
	@State private var pokemonSearch: String = ""
	
	var body: some View {
		VStack {
			searchBar
			
			Divider().background(Color("grayscale-50"))
				.padding(.bottom, 16)
		}
		.frame(maxWidth: .infinity)
		
	}
	
	var searchBar: some View {
		RoundedRectangle(cornerRadius: 24)
			.stroke(Color("grayscale-50"), lineWidth: 1.5)
			.frame(height: 48)
			.overlay(
				HStack {
					Image(systemName: "magnifyingglass")
						.foregroundColor(Color("grayscale-600"))
					TextField("Search...", text: $pokemonSearch)
				}
					.padding(.horizontal, 16)
			)
			.padding(16)
	}
}


#Preview {
	SearchBarView()
}
