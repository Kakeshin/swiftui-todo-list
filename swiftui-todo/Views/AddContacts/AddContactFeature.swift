//
//  AddContactFeature.swift
//  swiftui-todo
//
//  Created by Kakeshin on 2023/10/23.
//

import Foundation
import ComposableArchitecture

struct AddContactFeature: Reducer {
    @Dependency(\.dismiss) private var dismiss

    struct State: Equatable {        
        var contact: Contact
    }

    enum Action: Equatable {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
        case delegate(Delegate)

        enum Delegate: Equatable {
            case saveContact(Contact)
        }
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .run { _ in
                    await self.dismiss()
                }
            case .saveButtonTapped:
                return .run { [contact = state.contact] send in
                    await send(.delegate(.saveContact(contact)))
                    await self.dismiss()
                }
            case let .setName(name):
                state.contact.name = name
                return .none
            case .delegate:
                return .none
            }
        }
    }
}
