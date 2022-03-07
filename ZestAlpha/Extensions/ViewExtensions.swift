//
//  ViewExtensions.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/7/22.
//

import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

