//
//  CardView.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 27/05/24.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content:() -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
                .padding()
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
        }
        .padding([.leading, .trailing])
    }
}
