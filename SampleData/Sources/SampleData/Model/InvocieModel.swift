//
//  File.swift
//  
//
//  Created by SabariZuper on 15/05/24.
//

import Foundation

public struct InvoiceApiModel: Identifiable, Hashable {
    public let id = UUID()
    public let invoiceNumber: Int
    public let customerName: String
    public let total: Int
    public let status: InvoiceStatus
}

public enum InvoiceStatus: CaseIterable {
    case draft, pending, paid, badDebt
}

