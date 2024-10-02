//
//  Lab02App.swift
//  Lab02
//
//  Created by Gustavo on 29/09/24.
//

import SwiftUI

@main
struct Lab02App: App {
    @State var isLoggedin:Bool = false
    var body: some Scene {
        WindowGroup {
            if isLoggedin {
                HomeView()
            } else {
                LoginView(isLoggedin: $isLoggedin)
            }
        }
    }
}
