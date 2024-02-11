//
//  OnboardingView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 11/02/24.
//

import SwiftUI

struct OnboardingView: View {
  var body: some View {
    VStack(spacing: 24) {
        trainersImage
        
        titleAndDescription
    
        onboardingProgress
        
        continueButton
        
      }
      .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .bottom)
      .padding(.horizontal, 16)
      .padding(.bottom, 40)
      .background(Color("grayscale-50"))
    
  }
  
  var trainersImage: some View {
    ZStack {
      Image("trainersGroup")
        .resizable()
        .frame(width: 342, height: 264)
        .aspectRatio(contentMode: .fit)

    }
  }
  
  var titleAndDescription: some View {
    VStack(spacing: 16) {
      Text("Todos os Pokémons em um só Lugar")
        .font(.custom("Poppins-Medium", size: 26))
        .multilineTextAlignment(.center)
        .foregroundStyle(Color("grayscale-950"))
      
      
      Text("Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo")
        .font(.custom("Poppins-Regular", size: 14))
        .multilineTextAlignment(.center)
        .foregroundStyle(Color("grayscale-600"))
    }
  }
  
  var onboardingProgress: some View {
    HStack(spacing: 8) {
      Rectangle()
        .frame(width: 32, height: 8)
        .clipShape(.capsule)
        .foregroundStyle(Color("bluescale-00"))
      
      Circle()
        .frame(height: 8)
        .foregroundStyle(Color("bluescale-50"))
    }
  }
  
  var continueButton: some View {
    Button(action: {
      
    }, label: {
      Rectangle()
        .frame(height: 40)
        .clipShape(.capsule)
        .foregroundStyle(Color("bluescale-00"))
        .overlay {
          Text("Continuar")
            .foregroundStyle(Color("grayscale-00"))
            .font(.custom("Poppins-Bold", size: 16))
        }
    })
  }
}

#Preview {
    OnboardingView()
}
