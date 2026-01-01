//
//  SwiftUIView.swift
//  WodDesignSystem
//
//  Created by Konstantinos Kolioulis on 31/12/25.
//

import SwiftUI

public struct WodButton: View {
    
    public struct Values {
        public let systemImage: String?
        public let text: String?
        public let action: () -> Void
        
        public init(
            systemImage: String?,
            text: String?,
            action: @escaping () -> Void
        ) {
            self.systemImage = systemImage
            self.text = text
            self.action = action
        }
    }

    public let values: Values
    
    public init(
        values: Values,
    ) {
        self.values = values
    }
    
    public var body: some View {
        Button(
            action: values.action,
            label: {
                HStack {
                    if let systemImage = values.systemImage {
                        Image(systemName: systemImage)
                            .foregroundStyle(.white)
                    }
                    if let text = values.text {
                        Text(text)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                }
                .padding()
                .setGlass(withColor: Color.wodSecond)
            }
        )
    }
}

#Preview {
    WodButton(values: .init(systemImage: "plus", text: "add", action: {}))
}

private extension View {
    @ViewBuilder
    func setGlass(withColor color: Color) -> some View {
        let cornerRadius: CGFloat = 16
        if #available(iOS 26.0, *) {
            glassEffect(
                .regular.tint(color).interactive(),
                in: .rect(cornerRadius: cornerRadius)
            )
        } else {
            background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(color)
            }
        }
    }
}
