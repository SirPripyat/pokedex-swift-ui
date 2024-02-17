//
//  BottomBarItemView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 14/02/24.
//

import SwiftUI

struct BottomBarItemView: View {
	
	var bottomBarItem: BottomBarItensType
	@Binding var selectedTab: BottomBarItensEnum
	
	var body: some View {
		
		let tabIsActived = selectedTab == bottomBarItem.itemEnum
		
		return Button {
			buttonAction
		} label: {
			buttonLabel(tabIsActived: tabIsActived)
		}
		.frame(width: 56, height: 56)
	}
	
	var buttonAction: Void {
		withAnimation {
			selectedTab = bottomBarItem.itemEnum
		}
	}
	
	func buttonLabel(tabIsActived: Bool) -> some View {
		let icon = tabIsActived ? bottomBarItem.activedIcon : bottomBarItem.icon
		let fontColor = tabIsActived ? "bluescale-00" : "grayscale-500"
		
		return VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
			Image(icon)
				.resizable()
				.scaledToFit()
				.frame(width: 24, height: 24)
			
			if tabIsActived {
				Text(bottomBarItem.label)
					.font(FontMaker.makeFont(.poppinsMedium, 12))
					.foregroundStyle(Color(fontColor))
			}
		}
	}
}

#Preview {
	BottomBarItemView(bottomBarItem: bottomBarItens[0], selectedTab: .constant(.pokedex))
}
