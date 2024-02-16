//
//  BottomBarItemView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 14/02/24.
//

import SwiftUI

struct BottomBarItemView: View {
	
	var bottomBarItem: BottomBarItensType
	
	var body: some View {
		
		return Button {
			buttonAction
		} label: {
			buttonLabel
		}
		.frame(width: 56, height: 56)
	}
	
	var buttonAction: Void {
		print(bottomBarItem.isActived)
	}
	
	var buttonLabel: some View {
		VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
			Image(icon)
				.resizable()
				.scaledToFit()
				.frame(width: 24, height: 24)
			
			Text(bottomBarItem.label)
				.font(FontMaker.makeFont(.poppinsMedium, 12))
				.foregroundStyle(Color(fontColor))
		}
	}
	
	var icon: String {
		bottomBarItem.isActived == Bool(true) ?  bottomBarItem.activedIcon : bottomBarItem.icon
	}
	
	var fontColor: String {
		bottomBarItem.isActived == Bool(true) ?  "bluescale-00"	: "grayscale-500"
	}
}

#Preview {
	BottomBarItemView(bottomBarItem: bottomBarItens[0])
}
