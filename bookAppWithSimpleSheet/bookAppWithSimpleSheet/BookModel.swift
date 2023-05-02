//
//  BookModel.swift
//  bookAppWithSimpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import Foundation

struct BookModel: Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var cover: String
    var year: Int
    var price: Double
}
