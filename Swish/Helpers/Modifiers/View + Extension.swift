//
//  View + Extension.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI

extension View {
    func roundedCorners(_ cornerSize: CGFloat) -> some View {
        self
            .clipShape(RoundedRectangle(cornerRadius: cornerSize))
    }
    
    func customBack(action: @escaping () -> Void ) -> some View {
        self
            .overlay(alignment: .topLeading) {
                BackButton(action: action)
                    .frame(width: 40)
                    .padding(.top, 30)
                    .padding(.leading)
            }
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    @ViewBuilder
    func sheetAlert(
        isPresented: Binding<Bool>,
        title: String,
        message: String,
        buttonAction: @escaping () -> Void = {}
    ) -> some View {
        self
            .sheet(isPresented: isPresented) {
                VStack(spacing: 20) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.red)
                    
                    VStack(alignment: .center, spacing: 8) {
                        Text(title)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text(message)
                            .font(.callout)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                    }
                    
                    Button(action: {
                        isPresented.wrappedValue = false
                        buttonAction()
                    }) {
                        Text("OK")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.primary)
                            .foregroundStyle(Color(.systemBackground))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.horizontal)
                }
                .padding(20)
                .presentationBackground(.background)
                .presentationDetents([.height(300)])
                .presentationCornerRadius(30)
            }
    }
}
