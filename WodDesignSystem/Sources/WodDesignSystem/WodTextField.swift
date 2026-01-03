//
//  WodTextField.swift
//  WodDesignSystem
//
//  Created by Konstantinos Kolioulis on 1/1/26.
//

import SwiftUI

public struct WodTextField: View {
    @Binding var text: String
    let placeholder: String
    @FocusState private var isFocused: Bool
    
    public init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
        self.isFocused = isFocused
    }
    
    public var body: some View {
        TextField(placeholder, text: $text)
            .focused($isFocused)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemGray6))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isFocused ? Color.wodPrimary : Color.clear, lineWidth: 1)
            )
            .tint(Color.wodPrimary)
    }
}

#Preview {
    WodTextField(text: .constant(""), placeholder: "placeholder")
        .padding()
}
