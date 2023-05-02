//
//  BookItemOrder.swift
//  bookAppWithSimpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import Foundation

struct BookItemOrder: Identifiable {
    let id = UUID()
    var bookItem: BookModel
    var unit: Int
    
    func getItemCost() -> Double {
        return bookItem.price * Double(unit)
    }
    
    func formatItemCost() -> String {
        let itemCost = getItemCost()
        return "$\(itemCost.formatted())"
    }
    
    func describeBookItemOrder() -> String {
        return "\(bookItem.title) x \(unit): \(formatItemCost())"
    }
}
