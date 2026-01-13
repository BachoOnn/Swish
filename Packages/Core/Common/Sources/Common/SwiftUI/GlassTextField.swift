//
//  GlassTextField.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI

public struct GlassTextField: View {
    let title: String
    let icon: String
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    public init(title: String, icon: String, text: Binding<String>) {
        self.title = title
        self.icon = icon
        self._text = text
    }
    
    private var shouldFloat: Bool {
        isFocused || !text.isEmpty
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(isFocused ? .primary : .primary.opacity(0.6))
                    .font(shouldFloat ? .caption : .body)
                    .offset(y: shouldFloat ? -45 : 0)
                    .offset(x: shouldFloat ? 0 : 50)
                    .scaleEffect(shouldFloat ? 0.95 : 1.0, anchor: .leading)
                
                HStack(spacing: 12) {
                    Image(systemName: icon)
                        .foregroundColor(.primary.opacity(0.6))
                        .frame(width: 24, height: 30)
                    
                    TextField("", text: $text)
                        .focused($isFocused)
                        .textInputAutocapitalization(.words)
                        .foregroundColor(.primary)
                        .textContentType(.none)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6).opacity(0.5))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isFocused ? Color.primary : Color.primary.opacity(0.2), lineWidth: 1.5)
            )
        }
        .animation(.easeOut(duration: 0.2), value: shouldFloat)
        .animation(.easeOut(duration: 0.2), value: isFocused)
    }
}

