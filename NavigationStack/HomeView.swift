//
//  ContentView.swift
//  NavigationStack
//
//  Created by 小駒翼 on 2023/08/20.
//

import ComposableArchitecture
import SwiftUI

struct HomeView: View {
    let store: StoreOf<Home>
    
    var body: some View {
        NavigationStack {
            NavigationStackStore(
                self.store.scope(state: \.path, action: Home.Action.path)
            ) {
                List {
                    NavigationLink(
                        "インターバル",
                        state: Home.Path.State.screenTraining()
                    )
                    NavigationLink(
                        "タイマー",
                        state: Home.Path.State.screenTimer
                    )
                    NavigationLink(
                        "設定",
                        state: Home.Path.State.screenSettings
                    )
                }
            } destination: {
                switch $0 {
                case .screenTimer, .screenSettings:
                    ContentView()
                case .screenTraining:
                    CaseLet(
                        /Home.Path.State.screenTraining,
                         action: Home.Path.Action.screenTraining,
                         then: TrainingView.init(store:)
                    )
                }
            }
        }
    }
}
