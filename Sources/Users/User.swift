class User {
    private var cart: [Product] = []
    var name: String
    var payment: PaymentMethod = .cash
    
    init(name: String) {
        self.name = name
    }
    
    func addToCart(_ product: Product) {
        cart.append(product)
    }
    
    func removeProduct(byID id: Int) {
        
        var index = 0
        for item in cart {
            if item.id == id {
                cart.remove(at: index)
                break
            }
            index += 1
        }
        
        /// Alternatively, you could use the .enumerated()
        /// function that exists for all collections,
        /// which returns a tuple type, with the first
        /// element being the index, and the second being
        /// the actual value for this iteration. You can
        /// then very simply destructure the tuple into
        /// two custom constants that you can reference
        /// inside the block.
        // for (index, item) in cart.enumerated() {
        //     if item.id == id {
        //         cart.remove(at: index)
        //         break
        //     }
        // }
        
        /// Alternatively, you could use one of the many
        /// collection functions swift provides with a trailing
        /// closure, like firstIndex.
        // let index = cart.firstIndex { product in
        //    product.id == id
        // }
        // if let index = index {
        //     cart.remove(at: index)
        // }
    }
    
    func cartTotal() -> Double {
        var total = 0.0
        for product in cart {
            total += product.price
        }
        return total
        
        /// Alternatively, you could use a combination
        /// of functions in what is called "functional
        /// chaining" to perform a transformation on a
        /// collection with each successive call until
        /// it holds the correct information.
        // return cart
        //    .map({ $0.price })
        //    .reduce(0, +)
    }
    
    enum Sort {
        case price, category
    }
    
    func sortCart(by sort: Sort) {
        cart = sortedCart(by: sort)
    }
    
    func sortedCart(by sort: Sort) -> [Product] {
        let result = cart.sorted { lhs, rhs in
            switch sort {
            case .price:
                lhs.price < rhs.price
            case .category:
                lhs.category.rawValue < rhs.category.rawValue
            }
        }
        return result
    }
}

extension User {
    
    func printReceipt() {
        print("\(userName()) receipt")
        for (index, product) in cart.enumerated() {
            print("\(index+1). \(product.printData())")
        }
        print("Total: \(cartTotal().asDollars())")
        print("Payment Information: \(payment)")
        print("")
    }
    
    func userName() -> String {
        var user: String = "Guest user"
        if self is PremiumUser {
            user = self.name
        }
        return user
    }
}
