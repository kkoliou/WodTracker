//
//  ExerciseListItem.swift
//  WodDesignSystem
//
//  Created by Konstantinos Kolioulis on 3/1/26.
//

import SwiftUI

public struct ExerciseListItem: View {
    
    let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        HStack {
            Text(text)
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color(UIColor.systemGray6))
        }
    }
}

#Preview {
    ExerciseListItem(text: "Hang power clean")
}
