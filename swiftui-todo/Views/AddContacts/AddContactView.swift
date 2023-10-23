//
//  AddContactView.swift
//  swiftui-todo
//
//  Created by Kakeshin on 2023/10/23.
//

import SwiftUI
import ComposableArchitecture

struct AddContactView: View {
    let store: StoreOf<AddContactFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Form {
                TextField("Name", text: viewStore.binding(get: \.contact.name,
                                                          send: { .setName($0) }))
                Button() {
                    viewStore.send((.saveButtonTapped))
                } label: {
                    Text("Save")
                }
            }
            .toolbar {
                ToolbarItem {
                    Button() {
                        viewStore.send(.cancelButtonTapped)
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddContactView(
            store: Store(
                initialState: AddContactFeature.State(
                    contact: Contact(id: UUID(), name: "John")
                )
            ) {
                AddContactFeature()
            }
        )
    }
}
