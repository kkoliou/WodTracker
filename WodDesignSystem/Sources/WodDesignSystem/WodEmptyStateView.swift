//
//  WodEmptyStateView.swift
//  WodDesignSystem
//
//  Created by Konstantinos Kolioulis on 31/12/25.
//

import SwiftUI

public struct WodEmptyStateView: View {
    
    public let systemImage: String?
    public let title: String?
    public let description: String?
    public let button: WodButton.Values?
    
    public init(
        systemImage: String?,
        title: String?,
        description: String?,
        button: WodButton.Values?
    ) {
        self.systemImage = systemImage
        self.title = title
        self.description = description
        self.button = button
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            if let systemImage {
                Image(systemName: systemImage)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color.wodPrimary)
            }
            
            if let title {
                Text(title)
            }
            
            if let description {
                Text(description)
                    .fontWeight(.thin)
            }
            
            if let button {
                WodButton(values: button)
                    .padding(.top, 24)
            }
        }
    }
}

#Preview {
    WodEmptyStateView(
        systemImage: "figure.strengthtraining.traditional",
        title: "No exercises yet",
        description: "Add your first exercise to start tracking PRs",
        button: .init(
            systemImage: "plus",
            text: "Add",
            action: {}
        )
    )
}
