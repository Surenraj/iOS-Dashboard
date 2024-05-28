//
//  InvoiceView.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct InvoiceView: View {
    
    @State private var selectedTab: InvoiceStatus = .paid
    let viewModel: InvoiceViewModel = InvoiceViewModel()
    @State private var refreshID = UUID()
    
    var body: some View {
        VStack(spacing: 10) {
            NavigationBarView(title: "Invoice (\(viewModel.invoices.count))", showBackBtn: true)
            ProgressChart(
                items: viewModel.invoices,
                totalItems: viewModel.invoices.count,
                statusExtractor: \.status,
                colorMapping: Utils.shared.colorMappingForInvoiceStatus,
                totalValueLbl: "Total Value ($\(viewModel.getTotalOfInvoices()))",
                statusValueLbl: "$\(viewModel.getTotalOfSpecificInvoice(status: .paid)) collected"
                )
            .padding()
            
            TabBar(
                selectedTab: $selectedTab,
                tabs: [
                    ("Paid (\(viewModel.getCountOfSpecificInvoice(status: .paid)))", .paid),
                    ("Draft (\(viewModel.getCountOfSpecificInvoice(status: .draft)))", .draft),
                    ("Pending (\(viewModel.getCountOfSpecificInvoice(status: .pending)))", .pending),
                    ("Bad Debt (\(viewModel.getCountOfSpecificInvoice(status: .badDebt)))", .badDebt),
                    
                ]
            )
            Divider()
            ScrollView {
                VStack {
                    ForEach(filteredInvoices, id: \.id) { invoice in
                        InvoiceCell(invoice: invoice)
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
    
    private var filteredInvoices: [InvoiceApiModel] {
        viewModel.invoices.filter { $0.status == selectedTab }
    }
    
    private func refreshViews() async {
        try? await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        refreshID = UUID()
    }
}

#Preview {
    InvoiceView()
}
