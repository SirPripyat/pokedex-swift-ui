//
//  OnboardingView.swift
//  Pokedex
//
//  Created by Leonardo Rossi on 11/02/24.
//

import SwiftUI

struct OnboardingView: View {
  @ObservedObject var viewModel: OnboardingViewModel
  var body: some View {
    TabView(selection: $viewModel.currentStep) {
      ForEach(0..<viewModel.onboardingSteps.count, id: \.self) {
        index in
        VStack(spacing: 24) {
            trainersImage
            
            titleAndDescription(
              title: viewModel.onboardingSteps[index].title,
              description: viewModel.onboardingSteps[index].description
            )
        
            onboardingProgress
            
            continueButton(
              text: viewModel.onboardingSteps[index].buttonText
            )
            
          }
      }
      .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .bottom)
      .padding(.horizontal, 16)
      .padding(.bottom, 40)
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .background(Color("grayscale-50"))
  }
  
  var trainersImage: some View {
    
    let trainerImage =
      viewModel.currentStep == 0 ? "trainersGroup" : "trainerHilda"
    
    
    return ZStack {
      Image(trainerImage)
        .resizable()
        .frame(width: 342, height: 264)
        .aspectRatio(contentMode: .fit)
    }.transition(.opacity)
  }
  
  func titleAndDescription(title: String, description: String) -> some View {
    VStack(spacing: 16) {
      Text(title)
        .font(.custom("Poppins-Medium", size: 26))
        .multilineTextAlignment(.center)
        .foregroundStyle(Color("grayscale-950"))
      
      
      Text(description)
        .font(.custom("Poppins-Regular", size: 14))
        .multilineTextAlignment(.center)
        .foregroundStyle(Color("grayscale-600"))
    }
  }
  
  @ViewBuilder
  var onboardingProgress: some View {
    if viewModel.currentStep == 0  {
      HStack(spacing: 8) {
        Rectangle()
          .frame(width: 32, height: 8)
          .clipShape(.capsule)
          .foregroundStyle(Color("bluescale-00"))
        
        Circle()
          .frame(height: 8)
          .foregroundStyle(Color("bluescale-50"))
      }
    } else {
      HStack(spacing: 8) {
        Circle()
          .frame(height: 8)
          .foregroundStyle(Color("bluescale-50"))
        
        Rectangle()
          .frame(width: 32, height: 8)
          .clipShape(.capsule)
          .foregroundStyle(Color("bluescale-00"))
      }
    }
  }
  
  func continueButton(text: String) -> some View {
    Button(action: {
      if(viewModel.currentStep == 0) {
        viewModel.currentStep = 1;
      }
    }, label: {
      Rectangle()
        .frame(height: 40)
        .clipShape(.capsule)
        .foregroundStyle(Color("bluescale-00"))
        .overlay {
          Text(text)
            .foregroundStyle(Color("grayscale-00"))
            .font(.custom("Poppins-Bold", size: 16))
        }
    })
  }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
