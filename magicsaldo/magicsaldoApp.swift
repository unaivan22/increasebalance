//
//  magicsaldoApp.swift
//  magicsaldo
//
//  Created by una ivan on 17/10/23.
//

import SwiftUI

//@main
//struct magicsaldoApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


@main
struct magicsaldoApp: App {
    init() {
        // Set the default color scheme to dark mode
        if #available(iOS 14.0, *) {
            UserDefaults.standard.set(1, forKey: "AppleInterfaceStyle")
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
