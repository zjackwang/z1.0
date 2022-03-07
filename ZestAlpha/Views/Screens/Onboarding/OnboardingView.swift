//
//  OnboardingView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct OnboardingView: View {

    // Onboarding states
    @State var onboardingState: OnboardingStates = .welcome
    let onBoardingTransition = UIConstants.ONBOARDING_TRANSITION
    
    // Welcome states
    @State var welcomeState: WelcomeStates = .page1
    let welcomeTransition = UIConstants.WELCOME_TRANSITION
    @State var showWelcomeViews: [Bool] = [true, false, false]
    
    // Onboarding inputs
    @State var name: String = ""
    @State var age: Double = 25.0
    @State var gender: String = ""
    
    // For the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // Hide button
    @State var showButton: Bool = false
    
    // App storage
    @StateObject var svm = SettingsViewModel.shared

    
    // UI attributes
    private let background = UIConstants.ONBOARDING_BACKGROUND
    private let bodyColor: Color = UIConstants.ONBOARDING_BODY_TEXT_COLOR
    private let bodyFont: Font = UIConstants.ONBOARDING_BODY_TEXT
    private let buttonColor: Color = UIConstants.ONBOARDING_BUTTON_BG_COLOR
    private let buttonTextColor: Color = UIConstants.ONBOARDING_BUTTON_TEXT_COLOR
    private let buttonFont: Font = UIConstants.ONBOARDING_BUTTON_TEXT_FONT
    private let titleFont: Font = UIConstants.ONBOARDING_TITLE_FONT
    private let title1: String = UIConstants.ONBOARDING_TITLE1
    private let title2: String = UIConstants.ONBOARDING_TITLE2
    private let title3: String = UIConstants.ONBOARDING_TITLE3
    private let inputTextColor: Color = UIConstants.ONBOARDING_INPUT_TEXT_COLOR
    
    var body: some View {
        ZStack {
            //content
            ZStack {
                switch onboardingState {
                case .welcome:
                    welcomeSection
                        .transition(onBoardingTransition)
                case .addName:
                    addNameSection
                        .transition(onBoardingTransition)
                case .addAge:
                    addAgeSection
                        .transition(onBoardingTransition)
                case .addGender:
                    addGenderSection
                        .transition(onBoardingTransition)
                case .signedIn:
                    MainView()
                        .transition(onBoardingTransition)
                }
                
            }
            //buttons
            VStack {
                Spacer()
                bottomButton
            }
            .opacity(showButton ? 1.0 : 0.0)
            .padding(30)
        }
        .background(
            background
        )
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
    
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

// MARK: COMPONENTS

extension OnboardingView {
    private var bottomButton: some View {
        
        Button {
            handleButtonPressed()
        } label: {
            Text(onboardingState == .welcome ? "GET STARTED" :
                onboardingState == .addGender ? "FINISH" : "NEXT")
                .font(buttonFont)
                .foregroundColor(buttonTextColor)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(buttonColor)
                .cornerRadius(15)
        }
    }
    
    private var welcomeSection: some View {
        /*
         * Animate 3 screenns
         *  1. "Not just a match"
         *  2. "a Date."
         *  3. ZEST, get started
         */
        ZStack {
            welcomeSection1
                .hidden(!showWelcomeViews[0])
            welcomeSection2
                .hidden(!showWelcomeViews[1])
            welcomeSection3
                .hidden(!showWelcomeViews[2])
        }
        .onAppear {
            transitionWelcome()
        }
    }
    
    private var welcomeSection1: some View {
        VStack(spacing: 40){
            Spacer()
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(bodyColor)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var welcomeSection2: some View {
        VStack(spacing: 40){
            Spacer()
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(bodyColor)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var welcomeSection3: some View {
        VStack(spacing: 40){
            Spacer()
            Image("icon")
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
            Text(title3)
                .font(titleFont)
                .foregroundColor(bodyColor)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }
    
    private var addNameSection: some View {
        VStack(spacing: 20){
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(bodyColor)
                    
            TextField("Your name here...", text: $name)
                .font(.headline)
                .foregroundColor(inputTextColor)
                .frame(height: 55)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(20)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 20){
            Spacer()
            
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(bodyColor)
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(bodyColor)
            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 20){
            Spacer()
            
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(bodyColor)
            
            Picker(selection: $gender) {
                Text("Male").tag(1)
                Text("Female").tag("Female")
                Text("Non-binary").tag("Non-binary")
            } label: {
                Text(gender.count > 1 ? gender : "Select a gender")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.purple)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .cornerRadius(10)
            }
            .pickerStyle(.wheel)
            Spacer()
            Spacer()
        }
        .padding(30)
    }
}

// MARK: ENUMS

extension OnboardingView {
    enum OnboardingStates {
        case welcome
        case addName
        case addAge
        case addGender
        case signedIn
    }
    
    enum WelcomeStates {
        case page1
        case page2
        case page3
    }
}


// MARK: FUNCTION

extension OnboardingView {
    func handleButtonPressed() {
        withAnimation(.spring()) {
            switch onboardingState {
            case .welcome:
                onboardingState = .addName
            case .addName:
                guard name.count > 3 else {
                    showAlert(title: "Your name must be at least 3 characters long.")
                    return
                }
                onboardingState = .addAge
            case .addAge:
                onboardingState = .addGender
            case .addGender:
                // sign in
                onboardingState = .signedIn
                signIn()
            default:
                break
            }
        }
    }
    
    func transitionWelcome() {
        
        switch welcomeState {
        case .page1:
            withAnimation(Animation.welcomeAnimation(duration: 1.0, delay: 1.5)) {
                welcomeState = .page2
                showWelcomeViews[0].toggle()
                showWelcomeViews[1].toggle()
            }
            transitionWelcome()
        case .page2:
            withAnimation(Animation.welcomeAnimation(duration: 1.0, delay: 3.5)) {
                welcomeState = .page3
                showWelcomeViews[1].toggle()
                showWelcomeViews[2].toggle()
                showButton.toggle()
            }
            transitionWelcome()
        case .page3:
//            showWelcomeViews[2].toggle()
            break
        }
        
    }
    
    func signIn() {
        svm.name = name
        svm.currentUserAge = Int(age)
        svm.currentUserGender = gender
        withAnimation() {
            svm.isUserSignedIn = true
        }
        showButton.toggle()
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
}
