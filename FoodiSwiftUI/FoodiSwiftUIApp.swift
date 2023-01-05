//
//  FoodiSwiftUIApp.swift
//  FoodiSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 04/01/2023.
//

import SwiftUI

@main
struct FoodiSwiftUIApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
