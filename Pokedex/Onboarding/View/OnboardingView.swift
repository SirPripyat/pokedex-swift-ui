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
		ZStack {
			if viewModel.showSplashScreen {
				SplashView()
			} else {
				NavigationView {
					tabViewContent
						.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
						.background(Color("grayscale-50"))
						.overlay {
							pageIndicator
						}
				}
				
			}
		}
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
				withAnimation {
					self.viewModel.showSplashScreen = false
				}
			}
		}
		
	}
	
	var tabViewContent: some View {
		TabView(selection: $viewModel.currentStep) {
			ForEach(Array(viewModel.onboardingSteps.enumerated()), id: \.offset) {
				index, step in
				VStack(spacing: 48) {
					trainersImage(index: index)
					
					titleAndDescription(
						title: step.title,
						description: step.description
					)
					
					continueButton(
						text: step.buttonText
					)
					
				}
			}
			.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .bottom)
			.padding(.horizontal, 16)
			.padding(.bottom, 40)
		}
	}
	
	var pageIndicator: some View {
		HStack(spacing: 8) {
			ForEach(viewModel.onboardingSteps.indices, id: \.self) {
				index in
				let widthBasedOnCurrentStep: CGFloat = viewModel.currentStep == index ? 32 : 8
				let colorBasedOnCurrentStep: String = viewModel.currentStep == index ? "bluescale-00" : "bluescale-50"
				
				Capsule()
					.frame(width: widthBasedOnCurrentStep, height: 8)
					.foregroundStyle(Color(colorBasedOnCurrentStep))
					.animation(.bouncy, value: viewModel.currentStep)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
		.padding(.bottom, 100)
	}
	
	func trainersImage(index: Int) -> some View {
		
		let trainerImage = index == 0 ? "trainersGroup" : "trainerHilda"
		
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
				.font(FontMaker.makeFont(.poppinsMedium, 26))
				.multilineTextAlignment(.center)
				.foregroundStyle(Color("grayscale-950"))
			
			
			Text(description)
				.font(FontMaker.makeFont(.poppinsRegular, 14))
				.multilineTextAlignment(.center)
				.foregroundStyle(Color("grayscale-600"))
		}
	}
	
	@ViewBuilder
	func continueButton(text: String) -> some View {
		if viewModel.currentStep == 0 {
			Button(action: {
				viewModel.currentStep = 1;
			}, label: {
				buttonStyles(text: text)
			})
		} else {
			NavigationLink {
				HomeView()
			} label: {
				buttonStyles(text: text)
			}
		}
	}
	
	func buttonStyles(text: String) -> some View {
		Rectangle()
			.frame(height: 40)
			.clipShape(.capsule)
			.foregroundStyle(Color("bluescale-00"))
			.overlay {
				Text(text)
					.foregroundStyle(Color("grayscale-00"))
					.font(FontMaker.makeFont(.poppinsBold, 16))
			}
	}
	
	
	
	
}

#Preview {
	OnboardingView(viewModel: OnboardingViewModel())
}
