//
//  AnimationExtensions.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/7/22.
//

import SwiftUI

extension Animation {
    static func welcomeAnimation(duration: Double, delay: Double) -> Animation {
        Animation.easeInOut(duration: duration)
            .delay(delay) // one second delay
    }
}
