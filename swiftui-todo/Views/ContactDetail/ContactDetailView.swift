//
//  ContactDetailView.swift
//  swiftui-todo
//
//  Created by Kakeshin on 2023/10/23.
//

import SwiftUI
import ComposableArchitecture

struct ContactDetailView: View {
    let store: StoreOf<ContactDetailFeature>

    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Form {
                Button() {
                    viewStore.send(.deleteButtonTapped)
                } label: {
                    Text("Delete")
                }
            }
            .navigationTitle(Text(viewStore.contact.name))
        }
        .alert(store: store.scope(state: \.$alert, action: {
            .alert($0)
        }))
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(
            store: Store(
                initialState: ContactDetailFeature.State(
                    contact: Contact(id: UUID(), name: "John")
                )
            ) {
                ContactDetailFeature()
            }
        )
    }
}
