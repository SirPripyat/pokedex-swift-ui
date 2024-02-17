//
//  BottomBarItemModel.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 14/02/24.
//

import Foundation

var bottomBarItens: [BottomBarItensType] = [
	BottomBarItensType(id: 1, label: "Pokedéx", icon: "pokedex_default", activedIcon: "pokedex_active", itemEnum: .pokedex),
	BottomBarItensType(id: 2, label: "Regiões", icon: "regions_default", activedIcon: "regions_active", itemEnum: .regions),
	BottomBarItensType(id: 3, label: "Favoritos", icon: "favorites_default", activedIcon: "favorites_active", itemEnum: .favorities),
	BottomBarItensType(id: 4, label: "Perfil", icon: "user_default", activedIcon: "user_active", itemEnum: .user),
]
