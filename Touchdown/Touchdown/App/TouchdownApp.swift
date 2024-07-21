//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Leo Merelo on 10/6/24.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
