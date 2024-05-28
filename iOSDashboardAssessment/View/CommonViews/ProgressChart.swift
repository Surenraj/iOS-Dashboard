//
//  ProgressChart.swift
//  iOSDashboardAssessment
//
//  Created by Suren Raj on 28/05/24.
//

import SwiftUI
import SampleData

struct ProgressChart<Item, Status: Hashable>: View where Item: Identifiable {
    var items: [Item]
    var totalItems: Int
    var statusExtractor: KeyPath<Item, Status>
    var colorMapping: (Status) -> Color
    var totalValueLbl: String? = ""
    var statusValueLbl: String? = ""
    var splitupViewEnabled: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                if let total = totalValueLbl , !total.isEmpty {
                    Text(total)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                }
                Spacer()
                if let statusValue = statusValueLbl , !statusValue.isEmpty {
                    Text(statusValue)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    ForEach(sortedStatusCounts(), id: \.0) { status, count in
                        if count > 0 {
                            Rectangle()
                                .fill(colorMapping(status))
                                .frame(width: geometry.size.width * CGFloat(count) / CGFloat(totalItems))
                        }
                    }
                }
            }
            .frame(height: 20)
            .cornerRadius(5)
            if splitupViewEnabled {
                ProgressChartSplitup(statusCounts: sortedStatusCounts(), colorMapping: colorMapping)
            }
        }
    }
    
    private func sortedStatusCounts() -> [(Status, Int)] {
        let statusCounts = Dictionary(grouping: items, by: { $0[keyPath: statusExtractor] })
            .mapValues { $0.count }
        return statusCounts.sorted { $0.value > $1.value }
    }
}

struct ProgressChartSplitup<Status: Hashable>: View {
    var statusCounts: [(Status, Int)]
    var colorMapping: (Status) -> Color

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
            ForEach(statusCounts, id: \.0) { status, count in
                HStack {
                    Rectangle()
                        .fill(colorMapping(status))
                        .frame(width: 12, height: 12)
                        .cornerRadius(3)
                    Text("\(status) (\(count))")
                        .font(.subheadline)
                        .padding(.leading, 5)
                }
            }
        }
        .padding()
    }
}
