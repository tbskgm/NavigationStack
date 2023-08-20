//
//  NavigationStackApp.swift
//  NavigationStack
//
//  Created by 小駒翼 on 2023/08/20.
//

import ComposableArchitecture
import SwiftUI

@main
struct NavigationStackApp: App {
    let state = Home.State(
        path: StackState([])
    )
    let reducer = Home()
    
    var body: some Scene {
        WindowGroup {
            HomeView(
                store: Store(initialState: state) {
                    Home()
                }
            )
        }
    }
}
