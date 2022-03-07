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
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // Onboarding inputs
    @State var name: String = ""
    @State var age: Double = 50.0
    @State var gender: String = ""
    
    // For the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    
    // App storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            //content
            ZStack {
                switch onboardingState {
                case .welcome:
                    welcomeSection
                        .transition(transition)
                case .addName:
                    addNameSection
                        .transition(transition)
                case .addAge:
                    addAgeSection
                        .transition(transition)
                case .addGender:
                    addGenderSection
                        .transition(transition)
                }
            }
            //buttons
            VStack {
                Spacer()
                bottomButton
            }
            .padding(30)
        }
        .alert(alertTitle, isPresented: $showAlert) {
            
        }
    }
    
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .background(.purple)
    }
}

// MARK: COMPONENTS

extension OnboardingView {
    private var bottomButton: some View {
        
        Button {
            handleButtonPressed()
        } label: {
            Text(onboardingState == .welcome ? "SIGN UP" :
                onboardingState == .addGender ? "FINISH" : "NEXT")
                .font(.headline)
                .foregroundColor(.purple)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
        }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 40){
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
            Text("Find Your Match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .overlay(
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundColor(.white)
                    , alignment: .bottom
                )
            Text("This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI techniques.")
                .fontWeight(.medium)
                .foregroundColor(.white)
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
                .foregroundColor(.white)
                    
            TextField("Your name here...", text: $name)
                .font(.headline)
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
                .foregroundColor(.white)
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
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
                .foregroundColor(.white)
            
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
                onboardingState = .welcome
                signIn()
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
        
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
}
