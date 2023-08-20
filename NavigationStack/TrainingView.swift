//
//  TrainingView.swift
//  NavigationStack
//
//  Created by 小駒翼 on 2023/08/20.
//

import ComposableArchitecture
import SwiftUI

struct TrainingView: View {
    let store: StoreOf<Interval>
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text("TrainingView")
        }
    }
}

//struct TrainingView_Previews: PreviewProvider {
//    static var previews: some View {
//        TrainingView(store: Store(initialState: Interval.State(), reducer: Interval()))
//    }
//}
