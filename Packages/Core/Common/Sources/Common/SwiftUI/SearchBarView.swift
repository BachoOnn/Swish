//
//  SearchBarView.swift
//  Common
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI

public struct SearchBarView: View {
    
    @Binding var searchText: String
    var isKeyboardFocused: FocusState<Bool>.Binding
    
    public var accentColor: Color
    public var placeholder: String
    
    public init(
        searchText: Binding<String>,
        isKeyboardFocused: FocusState<Bool>.Binding,
        placeholder: String = "Search by name...",
        accentColor: Color = .primary
    ) {
        self._searchText = searchText
        self.isKeyboardFocused = isKeyboardFocused
        self.placeholder = placeholder
        self.accentColor = accentColor
    }
    
    public var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(searchText.isEmpty ? .secondary : accentColor)
            
            TextField(placeholder, text: $searchText)
                .foregroundStyle(accentColor)
                .autocorrectionDisabled()
                .focused(isKeyboardFocused)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(searchText.isEmpty ? .secondary : Color.red)
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0 : 1)
                        .onTapGesture {
                            searchText = ""
                            isKeyboardFocused.wrappedValue = false
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white.opacity(0.4))
                .shadow(color: .gray.opacity(0.35), radius: 10)
        )
        .padding()
    }
}
