//
//  ContactDetailFeature.swift
//  swiftui-todo
//
//  Created by Kakeshin on 2023/10/23.
//

import Foundation
import ComposableArchitecture

struct ContactDetailFeature: Reducer {
    @Dependency(\.dismiss) private var dismiss

    struct State: Equatable {
        let contact: Contact
        @PresentationState var alert: AlertState<Action.Alert>?
    }

    enum Action: Equatable {
        case deleteButtonTapped
        case alert(PresentationAction<Alert>)
        case delegate(Delegate)

        enum Alert {
            case confirmDeletion
        }
        enum Delegate {
            case confirmDeletion
        }
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .deleteButtonTapped:
                state.alert = .deleteConfirmation
                return .none
            case .alert(.presented(.confirmDeletion)):
                return .run { send in
                    await send(.delegate(.confirmDeletion))
                    await self.dismiss()
                }
            case .alert, .delegate:
                return .none
            }
        }
    }
}
