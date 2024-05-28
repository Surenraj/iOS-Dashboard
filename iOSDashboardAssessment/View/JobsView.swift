//
//  JobsView.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct JobsView: View {
        
    @State private var selectedTab: JobStatus = .yetToStart
    @State private var refreshID = UUID()
    let viewModel: JobsViewModel = JobsViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            NavigationBarView(title: "Jobs (\(viewModel.jobs.count))", showBackBtn: true)
            ProgressChart(
                items: viewModel.jobs,
                totalItems: viewModel.jobs.count,
                statusExtractor: \.status,
                colorMapping: Utils.shared.colorMappingForJobStatus,
                totalValueLbl: "\(viewModel.jobs.count) Jobs",
                statusValueLbl: "\(viewModel.getCountOfSpecificJobs(jobStatus: .completed)) of \(viewModel.jobs.count) completed"
            )
            .padding()
            
            TabBar(
                selectedTab: $selectedTab,
                tabs: [
                    ("Yet to start (\(viewModel.getCountOfSpecificJobs(jobStatus: .yetToStart)))", .yetToStart),
                    ("In-progress (\(viewModel.getCountOfSpecificJobs(jobStatus: .inProgress)))", .inProgress),
                    ("Cancelled (\(viewModel.getCountOfSpecificJobs(jobStatus: .canceled)))", .canceled),
                    ("Completed (\(viewModel.getCountOfSpecificJobs(jobStatus: .completed)))", .completed),
                    ("In-Complete (\(viewModel.getCountOfSpecificJobs(jobStatus: .incomplete)))", .incomplete)
                ]
            )
            Divider()
            ScrollView {
                VStack {
                    ForEach(filteredJobs, id: \.id) { job in
                        JobCell(job: job)
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    }
                }
            }
            .id(refreshID)
            .refreshable {
                await refreshViews()
            }
            .onChange(of: selectedTab) { _ in
                refreshID = UUID()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var filteredJobs: [JobApiModel] {
        viewModel.jobs.filter { $0.status == selectedTab }
    }
    
    private func refreshViews() async {
        try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        refreshID = UUID()
    }
}

#Preview {
    JobsView()
}
