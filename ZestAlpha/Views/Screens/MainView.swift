//
//  MainView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct MainView: View {
    
    // Controls
    @State var state: ViewStates = .home // TODO: move to main view model
    @StateObject var dpvm  = DatePackageViewModel.shared
    
    let transition = UIConstants.MAIN_TRANSITION
    
    // Dimensions
    private let titleFont: Font = UIConstants.TITLE_TEXT_FONT
    
    
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
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                background
                    .ignoresSafeArea()
                // Content
                ZStack {
                    switch state {
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
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .principal) {
                    // TODO: LOGO + ICON
                    principalTitleText
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
            text: $dpvm.searchText,
            placement: .automatic,
            prompt: searchBarText)
        .onChange(of: dpvm.searchText) { searchText in
            userSearched(for: searchText)
        }
    }
}

// MARK: COMPONENTS

extension MainView {
    private var principalTitleText: some View {
        switch state {
        case .home:
            return Text("ZEST").font(titleFont)
        case .personal:
            return Text("NAME").font(.title)
        default:
            return Text("DEFAULT TITLE")
        }
    }
    
    private var interactiveLemonIcon: some View {
        Button {
            lemonIconPressed()
        } label: {
            LemonIcon(width: lemonIconWidth, height: lemonIconHeight, alignment: .center)
        }
    }
    
    private var searchBarText: String {
        switch state {
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
            backButtonPressed()
        } label: {
            BackArrow(width: backButtonWidth, height: backButtonHeight, alignment: backButtonAlignment, font: backButtonFont, color: backButtonColor)
        }
    }

    
}

// MARK: FUNCTION

extension MainView {
    func lemonIconPressed() {
        withAnimation(.easeInOut) {
            state = state == .home ? .personal : .home
        }
    }
    
    func backButtonPressed() {
        withAnimation(.easeOut) {
            state = .home
        }
    }
    
    func userSearched(for searchText: String) {
        if !searchText.isEmpty {
            dpvm.filterPackagesByNameAndDescription(searchText: searchText)
        } else {
            dpvm.datePackages = dpvm.samples
        }
    }
    
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
                .previewInterfaceOrientation(.portraitUpsideDown)
            MainView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
