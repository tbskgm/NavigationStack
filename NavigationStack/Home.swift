//
//  Home.swift
//  NavigationStack
//
//  Created by 小駒翼 on 2023/08/20.
//

import ComposableArchitecture
import SwiftUI


struct Home: Reducer {
    struct State: Equatable {
        var path = StackState<Path.State>()
    }
    
    enum Action: Equatable {
        case goBackToScreen(id: StackElementID)
        case goToScreenTapped
        case path(StackAction<Path.State, Path.Action>)
        case popToRoot
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .goBackToScreen(id):
                state.path.pop(to: id)
                return .none
                
            case .goToScreenTapped:
                state.path.append(.screenTraining())
                return .none
                
            case let .path(action):
                switch action {
                case .element(id: _, action: .screenTraining):
                    return .none
                default:
                    return .none
                }
                
            case .popToRoot:
                state.path.removeAll()
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            Path()
        }
    }
    
    struct Path: Reducer {
        enum State: Codable, Equatable, Hashable {
            case screenTraining(Interval.State = .init())
            case screenTimer
            case screenSettings
        }
        
        enum Action: Equatable {
            case screenTraining(Interval.Action)
        }
        
        var body: some Reducer<State, Action> {
            Scope(state: /State.screenTraining, action: /Action.screenTraining) {
                Interval()
            }
        }
    }
}


// MARK: - Interval

struct Interval: Reducer {
    struct State: Codable, Equatable, Hashable {
        var isAccessHealth = false
    }
    
    enum Action: Equatable {
        case checkHealthAccess
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .checkHealthAccess:
            return .none
        }
    }
}
