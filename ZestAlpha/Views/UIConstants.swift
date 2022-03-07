//
//  UIConstants.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI


struct UIConstants {
    
    /*
     * Screen dimensions
     */
    static let screenBounds = UIScreen.main.bounds
    static let SCREEN_WIDTH = screenBounds.width
    static let SCREEN_HEIGHT = screenBounds.height
    
    /*
     * Date package view dimensions
     */
    static let ROW_PADDING: CGFloat = 20
    static let ROW_WIDTH: CGFloat = SCREEN_WIDTH - 2 * ROW_PADDING
    
    static let DATE_PKG_COLUMNS = [
        GridItem(.fixed(LOGO_WIDTH), spacing: 25),
        GridItem(.fixed(ZESTY_DESC_WIDTH), spacing: 25),
        GridItem(.fixed(PKG_DESC_WIDTH), spacing: 25)
    ]
    
    static let DATE_PKG_LIST_ITEM_MARGIN: CGFloat = 10
    
    static let HEADER_COLUMNS = [
        GridItem(.fixed(SCREEN_WIDTH/3 - 10), spacing: SCREEN_WIDTH/3 +
                 0),
        GridItem(.fixed(SCREEN_WIDTH/3 + 10), spacing: SCREEN_WIDTH/3 - 0)
    ]
    
    static let RECT_FRAME_HEIGHT: CGFloat = 75
    static let RECT_FRAME_PADDING: CGFloat = 10
    static let RECT_FRAME_RADIUS: CGFloat = 10
    static let LOGO_WIDTH: CGFloat = RECT_FRAME_HEIGHT - 10
    static let ZESTY_DESC_WIDTH: CGFloat = RECT_FRAME_HEIGHT + 75
    static let PKG_DESC_WIDTH: CGFloat = RECT_FRAME_HEIGHT + 25
    
    /*
     * Color Palette
     */
    static let BG_COLOR: Color = Color("background")
    static let ON_BG_COLOR: Color = Color("onBackground")
    
    static let SURFACE_COLOR: Color = Color("surface")
    static let ON_SURFACE_COLOR: Color = Color("onSurface")
    
    static let PRIMARY_COLOR: Color = Color("primary")
    static let ON_PRIMARY_COLOR: Color = Color("onPrimary")

    static let SECONDARY_COLOR: Color = Color("secondary")
    static let ON_SECONDARY_COLOR: Color = Color("onSecondary")

    static let NEUTRAL_COLOR = ON_BG_COLOR
    
    /*
     * Text
     */
    static let TITLE_TEXT_FONT: Font = .system(size: 50, weight: .semibold, design: .default)
    static let BODY_TEXT_FONT: Font = .system(size: 11, weight: .regular, design: .serif)
    static let HEADER_TEXT_FONT: Font = .system(size: 13, weight: .semibold, design: .serif)
    
    /*
     * MARK: MAIN VIEW
     */
    static let MAIN_TRANSITION: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    static let MAIN_TITLE_WIDTH: CGFloat = SCREEN_WIDTH / 3
    
    // Profile Icon
    static let PROFILE_ICON_WIDTH: CGFloat = 50
    static let PROFILE_ICON_HEIGHT: CGFloat = 50
    
    // Lemon Icon
    static let LEMON_ICON_WIDTH: CGFloat = 75
    static let LEMON_ICON_HEIGHT: CGFloat = 75
    static let LEMON_ANIMATION: Animation = Animation.default.repeatForever(autoreverses: false)
    
    /*
     * Heart Icon
     */
    static let HEART_WIDTH: CGFloat = 35
    static let HRT_FILLED_COLOR: Color = SECONDARY_COLOR
    static let HRT_UNFILLED_COLOR: Color = NEUTRAL_COLOR
//    static let HRT_SHADOW_COLOR: Color = .gray
    static let HEART_TAP_ANIMATION: Animation = .interactiveSpring(response: 1.0,
                                          dampingFraction: 0.684,
                                          blendDuration: 1.0)
    
    /*
     * Star (favoriting)
     */
    static let STAR_COLOR: Color = PRIMARY_COLOR
    
    /*
     * Back Button
     */
    static let BACK_BUTTON_WIDTH: CGFloat = 35
    static let BACK_BUTTON_HEIGHT: CGFloat = 35
    static let BACK_BUTTON_ALIGNMENT: Alignment = .topLeading
    static let BACK_BUTTON_FONT: Font = .system(size: 40, weight: .semibold, design: .default)
    static let BACK_BUTTON_COLOR: Color = SURFACE_COLOR
    
    
    /*
     * MARK: ONBOARDING VIEW
     */
    
    static let ONBOARDING_TRANSITION: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    static let WELCOME_TRANSITION: AnyTransition = .asymmetric(
        insertion: AnyTransition.opacity.animation(Animation.default.delay(1.5)),
        removal: AnyTransition.opacity
    )
    
    static let ONBOARDING_BACKGROUND_COLORS = [SECONDARY_COLOR, PRIMARY_COLOR]
    
    static let ONBOARDING_BACKGROUND = LinearGradient(colors: ONBOARDING_BACKGROUND_COLORS, startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    static let ONBOARDING_BODY_TEXT_COLOR = BG_COLOR
    static let ONBOARDING_BODY_TEXT = BODY_TEXT_FONT
    static let ONBOARDING_BUTTON_BG_COLOR: Color = .white
    static let ONBOARDING_BUTTON_TEXT_COLOR = NEUTRAL_COLOR
    static let ONBOARDING_BUTTON_TEXT_FONT: Font = .system(size: 23, weight: .medium, design: .default)
    static let ONBOARDING_TITLE_FONT: Font = .system(size: 75, weight: .bold, design: .default)
    
    static let ONBOARDING_TITLE1 = "Not just a match,"
    static let ONBOARDING_TITLE2 = "a Date."
    static let ONBOARDING_TITLE3 = "ZEST"
    
    static let ONBOARDING_INPUT_TEXT_COLOR = NEUTRAL_COLOR
}


