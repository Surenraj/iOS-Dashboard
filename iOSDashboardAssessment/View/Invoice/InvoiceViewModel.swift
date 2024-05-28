//
//  InvoiceViewModel.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import Foundation
import SampleData
import SwiftUI

class InvoiceViewModel: ObservableObject {
    
    @Published var invoices = SampleData.generateRandomInvoiceList(size: 30)
    
    
    func getTotalOfSpecificInvoice(status: InvoiceStatus) -> Int {
        let list = invoices.filter({$0.status == status})
        
        var total = 0
        for valuee in list {
            total += valuee.total
        }
        return total
    }
    
    func getTotalOfInvoices() -> Int {
        var total = 0
        for valuee in invoices {
            total += valuee.total
        }
        return total
    }
    
    func getCountOfSpecificInvoice(status: InvoiceStatus) -> Int {
        return invoices.filter({$0.status == status}).count
    }
}
