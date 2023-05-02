//
//  BookOrder.swift
//  bookAppWithSimpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import Foundation

struct BookOrder {
    var bookItemOrders: [BookItemOrder]
    var formattedTotalCost: String {
        let totalCost = getTotalCost()
        return "$\(totalCost.formatted())"
    }
    //update this method so that units could be modified with repeating orders
    mutating func appendBookItemOrder(bookItemOrder: BookItemOrder) {
        var unitIsUpdated = false
        //go through each ordered item to see if it is the same as the current order
        for index in 0 ..< bookItemOrders.count {
            if bookItemOrders[index].bookItem.title == bookItemOrder.bookItem.title {
                bookItemOrders[index].unit += bookItemOrder.unit
                unitIsUpdated = true
            }//end of if statement
        }//end of your for loop
        
        //only append when there is no repeats
        if !unitIsUpdated {
            bookItemOrders.append(bookItemOrder)
        }
    }

    func getTotalCost() -> Double {
        var totalCost = 0.0
        for each in bookItemOrders {
            totalCost = totalCost + each.getItemCost()
        }
        return totalCost
    }
}
