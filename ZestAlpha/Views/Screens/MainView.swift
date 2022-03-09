//
//  MainView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct MainView: View {
    
    // Controls
    @StateObject var mvm = MainViewModel.shared
    @StateObject var dpvm  = DatePackageViewModel.shared
    @StateObject var pvm  = PersonalViewModel.shared
    @StateObject var svm  = SettingsViewModel.shared
    
    let transition = UIConstants.MAIN_TRANSITION
    
    // Dimensions
    private let titleFont: Font = UIConstants.TITLE_TEXT_FONT
    private let titleWidth: CGFloat = UIConstants.MAIN_TITLE_WIDTH
    
    // Profile Icon
    private let profileWidth: CGFloat = UIConstants.PROFILE_ICON_WIDTH
    private let profileHeight: CGFloat = UIConstants.PROFILE_ICON_HEIGHT
    
    // Lemon Icon
    private let lemonIconWidth: CGFloat = UIConstants.LEMON_ICON_WIDTH
    private let lemonIconHeight: CGFloat = UIConstants.LEMON_ICON_HEIGHT
    
    // Button
    let backButtonWidth: CGFloat = UIConstants.BACK_BUTTON_WIDTH
    let backButtonHeight: CGFloat = UIConstants.BACK_BUTTON_HEIGHT
    let backButtonAlignment: Alignment = UIConstants.BACK_BUTTON_ALIGNMENT
    let backButtonFont: Font = UIConstants.BACK_BUTTON_FONT
    let backButtonColor: Color = UIConstants.BACK_BUTTON_COLOR

    // Color Palette
    private let background: Color = UIConstants.BG_COLOR
    private let surface: Color = UIConstants.SURFACE_COLOR
    private let onBackground: Color = UIConstants.ON_BG_COLOR
    private let onSurface: Color = UIConstants.ON_SURFACE_COLOR
    private let primary: Color = UIConstants.PRIMARY_COLOR
    private let onPrimary: Color = UIConstants.ON_PRIMARY_COLOR
    private let secondary: Color = UIConstants.SECONDARY_COLOR
    private let onSecondary: Color = UIConstants.ON_SECONDARY_COLOR
    
    // Popup
    private let popupPos = UIConstants.POPUP_POS
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                    .ignoresSafeArea()
                // Content
                ZStack {
                    switch mvm.state {
                    case .home:
                        DatePackageListView(datePackages: $dpvm.datePackages)
                            .transition(transition)
                    case .personal:
                        PersonalView()
                            .transition(transition)
                    default:
                        Text("DEFAULT VIEW")
                            .transition(transition)
                    }
                }
                // Show popups
                popup
                    .position(popupPos)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    if mvm.state == .personal {
                        userProfilePicture
                            .padding([.bottom], 10)
                    }
                }
                ToolbarItemGroup(placement: .principal) {
                    // TODO: LOGO + ICON
                    principalTitleText
                        .foregroundColor(onBackground)
                        .frame(width: titleWidth)
                        .padding([.bottom], 10)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // Lemon Icon
                    interactiveLemonIcon
                        .padding([.bottom], 10)
                }
                
            }
        }
        // NOTE: iOS 15.0
        .searchable(
            text: mvm.state == .home ? $dpvm.searchText : $pvm.searchText,
            placement: .automatic,
            prompt: searchBarText)
        .onChange(
            of: mvm.state == .home ? dpvm.searchText : pvm.searchText,
            perform: mvm.state == .home ? dpvm.userSearched : pvm.userSearched
        )
//        .onChange(of: dpvm.searchText) { searchText in
//            dpvm.userSearched(for: searchText)
//        }
    }
}

// MARK: COMPONENTS

extension MainView {
    private var principalTitleText: some View {
        switch mvm.state {
        case .home:
            return Text("ZEST").font(titleFont)
        case .personal:
            return Text(svm.name).font(.title)
        default:
            return Text("DEFAULT TITLE")
        }
    }
    
    private var userProfilePicture: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: profileWidth, height: profileHeight)
            .foregroundColor(onSurface)
    }
    
    private var interactiveLemonIcon: some View {
        Button {
            mvm.lemonIconPressed()
        } label: {
            ZStack {
                LemonIcon(width: 75, height: 75, alignment: .center)
//                    .hidden(mvm.isLoading)
//                LoadingLemonIcon(width: 75, height: 75, alignment: .center)
//                    .hidden(!mvm.isLoading)
            }
        }
    }
    
    private var searchBarText: String {
        switch mvm.state {
        case .home:
            return "Find your next date!"
        case .personal:
            return "Search your favorite dates!"
        default:
            return "Type here"
        }
    }
    
    private var backButton: some View {
        Button {
            mvm.backButtonPressed()
        } label: {
            BackArrow(width: backButtonWidth, height: backButtonHeight, alignment: backButtonAlignment, font: backButtonFont, color: backButtonColor)
        }
    }
    
    private var popup: some View {
        ZStack {
            if dpvm.showPackageDescription {
                // background
                Rectangle()
                    .foregroundColor(secondary.opacity(0.75))
                VStack {
                    Text("Date Info")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(dpvm.shownInfo)
                        .font(.body)
                    Spacer()
                }
                .padding()
                .onTapGesture {
                    dpvm.showPackageDescription.toggle()
                    
                }
            }
        }
        .frame(width: 300, height: 200)
        .cornerRadius(20).shadow(radius: 20)
    }

    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
