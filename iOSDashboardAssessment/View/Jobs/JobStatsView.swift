//
//  JobStatsView.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct JobStatsView: View {
    
    let viewModel: JobsViewModel = JobsViewModel()
    
    var body: some View {
        CardView {
            VStack (spacing: 15) {
                
                Text("Job Stats")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Divider()
                    .background(.gray)
                
                ProgressChart(
                    items: viewModel.jobs,
                    totalItems: viewModel.jobs.count,
                    statusExtractor: \.status,
                    colorMapping: Utils.shared.colorMappingForJobStatus,
                    totalValueLbl: "\(viewModel.jobs.count) Jobs",
                    statusValueLbl: "\(viewModel.getCountOfSpecificJobs(jobStatus: .completed)) of \(viewModel.jobs.count) completed",
                    splitupViewEnabled: true
                )
            }
        }
    }
}

#Preview {
    JobStatsView()
}
