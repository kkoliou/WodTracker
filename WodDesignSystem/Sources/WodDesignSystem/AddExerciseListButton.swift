//
//  AddExerciseListButton.swift
//  WodDesignSystem
//
//  Created by Konstantinos Kolioulis on 3/1/26.
//

import SwiftUI

public struct AddExerciseListButton: View {
    
    @Binding var name: String
    let action: () -> Void
    
    public init(
        name: Binding<String>,
        action: @escaping () -> Void
    ) {
        self._name = name
        self.action = action
    }
    
    public var body: some View {
        Button(
            action: action,
            label: {
                HStack(spacing: 4) {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.wodPrimary)
                    Text("Add \"\(name)\"")
                        .foregroundStyle(Color.wodPrimary)
                    Spacer()
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(Color(UIColor.systemGray6))
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.wodPrimary, lineWidth: 1)
                }
            }
        )
    }
}

#Preview {
    AddExerciseListButton(name: .constant(""), action: {})
        .padding()
}
