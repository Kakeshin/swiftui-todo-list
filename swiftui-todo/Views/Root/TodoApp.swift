//
//  TodoApp.swift
//  swiftui-todo
//
//  Created by Kakeshin on 2023/10/19.
//

import SwiftUI
import ComposableArchitecture

@main
struct TodoApp: App {
    private static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
            ._printChanges()
    }
    var body: some Scene {
        WindowGroup {
            ContactsView(store: TodoApp.store)
        }
    }
}
