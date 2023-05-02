//
//  ApplicationData.swift
//  bookAppWithSimpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import Foundation

class ApplicationData: ObservableObject {
    @Published var appData: [BookModel]
    @Published var bookOrderData: BookOrder

    init() {
        appData = [
            BookModel(title: "Steve Jobs", author: "Walter Isaacson", cover: "book1", year: 2011, price: 18.99),
            BookModel(title: "The Road Ahead", author: "Bill Gates", cover: "book3", year: 1995, price: 12.99),
            BookModel(title: "Being Digital", author: "Nicholas Negroponte", cover: "book5", year: 1996, price: 9.99),
            BookModel(title: "Only the Paranoid Survive", author: "Andrew S. Grove", cover: "book6", year: 1999, price: 8.99)
        ]
        
        bookOrderData = BookOrder(bookItemOrders: [])
    }
    // function allow add new book
    func appendBook(titleInput: String, authorInput: String, yearInput: String, priceInput: String) {
        let title = titleInput.trimmingCharacters(in: .whitespaces)
        let author = authorInput.trimmingCharacters(in: .whitespaces)
        
        // Checking if things are empty
        // How to handle optionals
        guard let year = Int(yearInput), let price = Double(priceInput),
              !title.isEmpty && !author.isEmpty else {
            return
        }
        let newBook = BookModel(title: title, author: author, cover: "no cover", year: year, price: price)
        
        appData.append(newBook)
    }
}
