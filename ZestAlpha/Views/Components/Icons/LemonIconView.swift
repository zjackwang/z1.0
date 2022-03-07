//
//  LemonIcon.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct LemonIcon: View {
    // Dimensions & Placement
    var width: CGFloat
    var height: CGFloat
    var alignment: Alignment

    var body: some View {
        Image("icon")
            .resizable()
            .frame(width: width, height: height, alignment: alignment)
    }
}

struct LoadingLemonIcon: View {
    var width: CGFloat
    var height: CGFloat
    var alignment: Alignment

    @State var isLoading = false
    private let animation = UIConstants.LEMON_ANIMATION

    var body: some View {
        LemonIcon(width: 75, height: 75, alignment: .center)
            .rotationEffect(Angle(degrees: isLoading ? 1080 : 0))
            .onAppear {
                withAnimation(animation) {
                    isLoading.toggle()
                }
            }
    }
}

struct showLemon: View {
    @State var isLoading = false

    var body: some View {
        VStack {
            ZStack {
                LemonIcon(width: 75, height: 75, alignment: .center)
                    .hidden(isLoading)
                LoadingLemonIcon(width: 75, height: 75, alignment: .center)
                    .hidden(!isLoading)
            }
            Button {
                isLoading.toggle()
            } label: {
                Text("Spin")
            }
        }

    }
}


struct LemonIcon_Previews: PreviewProvider {
    static var previews: some View {
        showLemon()
    }
}
