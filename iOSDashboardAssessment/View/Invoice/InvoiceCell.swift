//
//  InvoiceCell.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct InvoiceCell: View {
    let invoice: InvoiceApiModel
    
    var body: some View {
        CardView {
            HStack {
                VStack(alignment: .leading) {
                    Text("#\(invoice.invoiceNumber)")
                        .font(.subheadline)
                    Text(invoice.customerName)
                        .font(.headline)
                    Text("$\(invoice.total)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
    }
}
