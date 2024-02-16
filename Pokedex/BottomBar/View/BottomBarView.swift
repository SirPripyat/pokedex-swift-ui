//
//  BottomBarView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 14/02/24.
//

import SwiftUI

struct BottomBarView: View {
	var body: some View {
		
		VStack(spacing: 0) {
			Divider().background(Color("grayscale-100"))
			
			HStack(spacing: 24) {
				ForEach(bottomBarItens) { item in
					BottomBarItemView(bottomBarItem: item)
				}
			}
			.padding(.vertical, 16)
			.padding(.horizontal, 32)
		}
	}
}

#Preview {
	BottomBarView()
}
