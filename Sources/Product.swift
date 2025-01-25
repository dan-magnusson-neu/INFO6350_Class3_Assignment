//
//  File.swift
//  Ecommerce
//
//  Created by Daniel Magnusson on 1/24/25.
//

import Foundation

struct Product {
    enum Category {
        case electronics, clothing, books
    }
    
    let id: Int
    let name: String
    let category: Category
    let price: Double
}

extension Product {
    func printData() -> String {
        "\(name) - \(category): \(price.asDollars())"
    }
}
