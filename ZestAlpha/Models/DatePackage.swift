//
//  DatePackage.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import Foundation
import UIKit

struct DatePackage: Identifiable, Codable {
    var id: String = UUID().uuidString
    let Name: String
    let ZestyDescription: String
    let Price: Double
    let PackageDescription: String
    let LogoURLString: String // TODO: Image hosted on CDN
    let BusinessName: String
    var isFavorited: Bool
}

extension DatePackage: Equatable {
    
}

extension DatePackage {
    static let samples = [
        DatePackage(
            Name: "SUP Example",
            ZestyDescription: """
            This is a cool date! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies, enim facilisis ullamcorper aliquam, sapien turpis rutrum nulla, ac auctor nibh eros quis mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed varius metus consequat, dictum magna eget, lobortis purus. Ut tortor sapien, iaculis vitae odio at, posuere euismod velit. Suspendisse potenti. Donec vehicula dui non commodo commodo. Pellentesque in mollis metus.
            """,
            Price: 19.99,
            PackageDescription: "Two SUPs for 2 hours each.",
            LogoURLString: "AustinRowingDockIcon",
            BusinessName: "LocalSUP",
            isFavorited: false
        ),
        DatePackage(
            Name: "Axe Throwing Example",
            ZestyDescription: """
            This is a cool axe date! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies, enim facilisis ullamcorper aliquam, sapien turpis rutrum nulla, ac auctor nibh eros quis mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed varius metus consequat, dictum magna eget, lobortis purus. Ut tortor sapien, iaculis vitae odio at, posuere euismod velit. Suspendisse potenti. Donec vehicula dui non commodo commodo. Pellentesque in mollis metus.
            """,
            Price: 24.99,
            PackageDescription: "1 hour of axe throwin for two.",
            LogoURLString: "",
            BusinessName: "AxesToThrow",
            isFavorited: false
        ),
        DatePackage(
            Name: "Escape Room Example",
            ZestyDescription: """
            This is a cool date for puzzle fiends! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies, enim facilisis ullamcorper aliquam, sapien turpis rutrum nulla, ac auctor nibh eros quis mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed varius metus consequat, dictum magna eget, lobortis purus. Ut tortor sapien, iaculis vitae odio at, posuere euismod velit. Suspendisse potenti. Donec vehicula dui non commodo commodo. Pellentesque in mollis metus.
            """,
            Price: 14.49,
            PackageDescription: "1 escape room puzzle for two.",
            LogoURLString: "",
            BusinessName: "EscapeArtists",
            isFavorited: false
        )
    ]
}
