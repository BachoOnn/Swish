//
//  GlassPasswordField.swift
//  Common
//
//  Created by Bacho on 13.01.26.
//

import SwiftUI

public struct GlassPasswordField: View {
    @Binding var password: String
    @State private var isSecure = true
    @FocusState private var isFocused: Bool
    let text: String
    
    public init(password: Binding<String>, text: String) {
        self._password = password
        self.text = text
    }
    
    private var shouldFloat: Bool {
        isFocused || !password.isEmpty
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .leading) {
                Text(text)
                    .foregroundColor(isFocused ? .primary : .primary.opacity(0.6))
                    .font(shouldFloat ? .caption : .body)
                    .offset(y: shouldFloat ? -45 : 0)
                    .offset(x: shouldFloat ? 0 : 50)
                    .scaleEffect(shouldFloat ? 0.95 : 1.0, anchor: .leading)
                
                HStack(spacing: 12) {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.primary.opacity(0.6))
                        .frame(width: 24, height: 30)
                    
                    Group {
                        if isSecure {
                            SecureField("", text: $password)
                                .textContentType(.oneTimeCode)
                        } else {
                            TextField("", text: $password)
                                .textContentType(.oneTimeCode)
                        }
                    }
                    .focused($isFocused)
                    .foregroundColor(.primary)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    
                    Button(action: { isSecure.toggle() }) {
                        Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.primary.opacity(0.6))
                    }
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
