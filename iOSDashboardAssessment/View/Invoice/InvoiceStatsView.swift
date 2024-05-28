//
//  InvoiceStatsView.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct InvoiceStatsView: View {
    let viewModel: InvoiceViewModel = InvoiceViewModel()
    
    var body: some View {
        CardView {
            VStack (spacing: 15) {
                
                Text("Invoice Stats")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Divider()
                    .background(.gray)
                
                ProgressChart(
                    items: viewModel.invoices,
                    totalItems: viewModel.invoices.count,
                    statusExtractor: \.status,
                    colorMapping: Utils.shared.colorMappingForInvoiceStatus,
                    totalValueLbl: "Total Value ($\(viewModel.getTotalOfInvoices()))",
                    statusValueLbl: "$\(viewModel.getTotalOfSpecificInvoice(status: .paid)) collected",
                    splitupViewEnabled : true
                )
            }
        }
    }
}

#Preview {
    InvoiceStatsView()
}
