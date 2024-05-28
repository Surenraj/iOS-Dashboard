//
//  JobsViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import Foundation
import SampleData

class JobsViewModel: ObservableObject {
    
    var jobs = SampleData.generateRandomJobList(size: 60)
    
    
    func getCountOfSpecificJobs(jobStatus: JobStatus) -> Int {
        return jobs.filter({$0.status == jobStatus}).count
    }
}
