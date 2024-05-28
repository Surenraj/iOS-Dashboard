//
//  Utils.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct Utils {
    
    static let shared = Utils()
    
    func colorMappingForJobStatus(status: JobStatus) -> Color {
        switch status {
        case .yetToStart: return .gray
        case .inProgress: return .blue
        case .canceled: return .red
        case .completed: return .green
        case .incomplete: return .orange
        }
    }

    func colorMappingForInvoiceStatus(_ status: InvoiceStatus) -> Color {
        switch status {
        case .draft: return .gray
        case .pending: return .yellow
        case .paid: return .green
        case .badDebt: return .red
        }
    }
    
    func getCurrentDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: Date())
    }
    
    func getFormattedDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: dateString) {
            let dateFormatter = DateFormatter()
            
            if Calendar.current.isDateInToday(date) {
                dateFormatter.dateFormat = "'Today' hh:mm a"
            } else {
                dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a"
            }
            
            return dateFormatter.string(from: date)
        } else {
            print("Failed to parse date.")
            return ""
        }
    }

}
