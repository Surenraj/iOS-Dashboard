//
//  NavigationBarView.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 27/05/24.
//

import SwiftUI

struct NavigationBarView: View {
    
    var title: String
    var showBackBtn: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            if showBackBtn {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                        Text(title)
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
            } else {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        Divider()
            .background(.gray)
    }
}

