class RegisteredUser: User {
    override func cartTotal() -> Double {
        let cart = sortedCart(by: .category)
        return cart.map({ product in
            switch product.category {
            case .books: product.price * 0.95
            case .clothing: product.price
            case .electronics: product.price * 0.97
            }
        }).reduce(0.0, +)
    }
}
