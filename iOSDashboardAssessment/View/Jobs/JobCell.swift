
//  JobCell.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct JobCell: View {
    let job: JobApiModel
    
    var body: some View {
        CardView {
            HStack {
                VStack(alignment: .leading) {
                    Text("#\(job.jobNumber)")
                        .font(.subheadline)
                    Text(job.title)
                        .font(.headline)
                    Text("\(Utils.shared.getFormattedDate(dateString: job.startTime)) - \(Utils.shared.getFormattedDate(dateString: job.endTime))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}
