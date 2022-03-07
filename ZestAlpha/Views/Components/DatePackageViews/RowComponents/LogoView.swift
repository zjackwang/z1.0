//
//  LogoView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI


struct LogoView: View {
    /*
     * UI
     */
    let logo: Image
    
    let backgroundColor: Color = UIConstants.SURFACE_COLOR
    let onBackgroundColor: Color = UIConstants.ON_SURFACE_COLOR
    
    let width: CGFloat = UIConstants.LOGO_WIDTH
    let height: CGFloat = UIConstants.LOGO_WIDTH
    


    /*
     * View Models
     */
    @StateObject var mvm = MainViewModel.shared
    
    // Heart
    var isFavorited: Bool
    
    
    var body: some View {
        ZStack {
            logo
                .resizable()
                .foregroundColor(.white)
                .frame(width: width-10, height: height-10, alignment: .center)
                .onTapGesture {
                    // Sheet on main view
                    mvm.showBusinessInfo.toggle()
                    print("DEV >> Showing business info")
                }
                .background(
                    ElevatedRectFrameView(
                        content: "",
                        backgroundColor: backgroundColor,
                        onBackgroundColor: onBackgroundColor,
                        width: width
                    )
    
                )
            if isFavorited {
                HeartIconView()
                    .position(x: 5, y: 0)
                    .zIndex(1)
            }
        }
        .frame(width: width + UIConstants.RECT_FRAME_PADDING, height: height)
    }
}

//struct LogoView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogoView(logo: Image("AustinRowingDockIcon"))
//    }
//}
