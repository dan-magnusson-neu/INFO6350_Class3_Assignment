struct Product {
    enum Category: String {
        case books, clothing, electronics
    }
    
    let id: Int
    let name: String
    let category: Category
    var price: Double
    
    mutating func applyCoupon(_ percentage: Double) {
        price = price * percentage
    }
    
    func printCategory() {
        print(category)
    }
}

extension Product {
    func printData() -> String {
        "\(name) - \(category): \(price.asDollars())"
    }
}
