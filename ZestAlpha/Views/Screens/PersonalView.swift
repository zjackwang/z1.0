//
//  PersonalView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct PersonalView: View {
    @StateObject var pvm = PersonalViewModel.shared
    @StateObject var svm  = SettingsViewModel.shared

    // Button Dimensions
    let backButtonWidth: CGFloat = UIConstants.BACK_BUTTON_WIDTH
    let backButtonHeight: CGFloat = UIConstants.BACK_BUTTON_HEIGHT
    let backButtonAlignment: Alignment = UIConstants.BACK_BUTTON_ALIGNMENT
    let backButtonFont: Font = UIConstants.BACK_BUTTON_FONT
    
    let textFont: Font = UIConstants.HEADER_TEXT_FONT
    
    // Text
    let textColor = UIConstants.ON_BG_COLOR
    
    var body: some View {
        VStack {
            if pvm.hasSavedPackages() {
                DatePackageListView(datePackages: $pvm.searchedDatePackages)
            } else {
                Spacer()
                Text("Favorite some date packages and they'll show up here!")
                    .font(textFont)
                    .frame(alignment: .center)
                    .foregroundColor(textColor)
                Spacer()
            }
            Text("SIGN OUT")
                .font(.title)
                .fontWeight(.bold)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
//                .background(.)
                .foregroundColor(textColor)
                .cornerRadius(15)
                .onTapGesture {
                    signOut()
                }
                
            }
    }
}

// MARK: COMPONENTS

extension PersonalView {
}

// MARK: FUNCTION

extension PersonalView {
    func signOut() {
        svm.isUserSignedIn = false
    }
}

struct DisplayPersonalView: View {
    
    @State var state: ViewStates = .personal
    
    var body: some View {
        PersonalView()
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayPersonalView()
    }
}
