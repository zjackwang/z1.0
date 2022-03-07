//
//  DatePackageListView.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import SwiftUI

struct DatePackageListView: View {
    @Binding var datePackages: [DatePackage]


    @StateObject var dpvm = DatePackageViewModel.shared
    @StateObject var mvm = MainViewModel.shared

    /*
     * UI elements
     */
    let columns = UIConstants.HEADER_COLUMNS
    let rowPadding = UIConstants.DATE_PKG_LIST_ITEM_MARGIN
    
    // Colors
    let background = UIConstants.BG_COLOR
    let onBackground = UIConstants.ON_BG_COLOR
    
    let favoritingAnimation: Animation = UIConstants.HEART_TAP_ANIMATION
    let favoritingColor: Color = UIConstants.STAR_COLOR
    let textColor: Color = UIConstants.NEUTRAL_COLOR
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                Text("Click For Info")
                    .font(UIConstants.HEADER_TEXT_FONT)
                    .foregroundColor(onBackground)
                Text("Click For Booking")
                    .font(UIConstants.HEADER_TEXT_FONT)
                    .foregroundColor(onBackground)
            }
            List {
                ForEach(datePackages) { datePackage in
                    DatePackageView(datePackage: datePackage)
                        .padding([.top, .bottom], rowPadding)
                        
                        .swipeActions(edge: .trailing) {
                            if !datePackage.isFavorited {
                                Button {
                                    print("Mark as favorite")
                                    withAnimation(favoritingAnimation) {
                                        dpvm.toggleDatePackageFavorite(for: datePackage.Name)
                                    }
                                } label: {
                                    Label("Favorite", systemImage: "star")
                                        .foregroundColor(textColor)
                                }
                                .tint(favoritingColor)
                            } else {
                                Button {
                                    print("Unfavoriting")
                                    withAnimation(favoritingAnimation) {
                                        dpvm.toggleDatePackageFavorite(for: datePackage.Name)
                                    }
                                } label: {
                                    Label("Unfavorite", systemImage: "star.slash")
                                        .foregroundColor(textColor)
                                }
                                .tint(favoritingColor)
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                print("Share")
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            .tint(.green)
                        }
                }
            }
            .refreshable {
                mvm.isLoading.toggle()
//                withAnimation(Animation.default.delay(2.0)) {
//                    mvm.isLoading.toggle()
//                }
            }
            .listStyle(.inset)
            .listRowSeparator(.hidden)
        }
    }
}

struct preview: View {
    @State var datePackages = DatePackage.samples
    var body: some View {
        DatePackageListView(datePackages: $datePackages)
    }
}

struct DatePackageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            preview()
        }
    }
}
