//
//  SearchBar.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var inEditing = false

    var body: some View {
        HStack{
            VStack{
                TextField("Search", text: $text)
                    .foregroundColor(.primary)

                if !text.isEmpty {
                                    Button(action: {
                                        self.text = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                    }
                                } else {
                                    EmptyView()
                                }
            }
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                        .foregroundColor(.secondary)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10.0)

        }
        .padding(.horizontal)


    }
}

