//
//  MainViewModel.swift
//  ZestAlpha
//
//  Created by Jack Wang on 3/5/22.
//

import Foundation

class MainViewModel: ObservableObject {
    
    static let shared = MainViewModel()
    private init() {}
    
    @Published var showBusinessInfo: Bool = false
}
