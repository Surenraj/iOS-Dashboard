//
//  DashboardView.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 27/05/24.
//

import SwiftUI
import SampleData

struct DashboardView: View {
    
    @State private var refreshID = UUID()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationBarView(title: "Dashboard")
                ScrollView {
                    VStack (spacing: 20) {
                        ProfileCardView(profileData: ProfileDataModel(name: SampleData.generateRandomCustomerName(), image: "profileImg"))
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        NavigationLink(destination: JobsView()) {
                            JobStatsView()
                        }
                        .foregroundColor(.primary)
                        NavigationLink(destination: InvoiceView()) {
                            InvoiceStatsView()
                        }
                        .foregroundColor(.primary)
                    }
                }
                .id(refreshID)
                .refreshable {
                    await refreshViews()
                }
            }
        }
    }
    
    private func refreshViews() async {
        try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        refreshID = UUID()
    }
}
#Preview {
    DashboardView()
}
