//
//  TabBar.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

import SwiftUI

struct TabBar<T>: View where T: Hashable {
    @Binding var selectedTab: T
    let tabs: [(String, T)]
    
    @Namespace private var underlineNamespace
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(tabs, id: \.1) { tab in
                        Button(action: {
                            withAnimation {
                                selectedTab = tab.1
                            }
                        }) {
                            VStack {
                                Text(tab.0)
                                    .padding(.vertical, 10)
                                    .foregroundColor(.black)
                                    .fontWeight(selectedTab == tab.1 ? .black : .regular)
                                if selectedTab == tab.1 {
                                    Color.blue
                                        .frame(height: 2)
                                        .matchedGeometryEffect(id: "underline", in: underlineNamespace)
                                } else {
                                    Color.clear.frame(height: 2)
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                }
                .padding(.horizontal)
            }
            .background(Color.white)
        }
        .padding(.bottom, 2)
    }
}


#Preview {
    ContentView()
}
