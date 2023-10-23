//
//  AlertState.swift
//  swiftui-todo
//
//  Created by Kakeshin on 2023/10/23.
//

import Foundation
import ComposableArchitecture

extension AlertState where Action == ContactsFeature.Action.Alert {
    static func deleteConfirmation(id: UUID) -> Self {
        Self {
            TextState("Are you sure?")
        } actions: {
            ButtonState(role: .destructive, action: .confirmDeletion(id: id)) {
                TextState("Delete")
            }
        }
    }
}

extension AlertState where Action == ContactDetailFeature.Action.Alert {
    static let deleteConfirmation = Self {
        TextState("Are you sure?")
    } actions: {
        ButtonState(role: .destructive, action: .confirmDeletion) {
            TextState("Delete")
        }
    }
}
