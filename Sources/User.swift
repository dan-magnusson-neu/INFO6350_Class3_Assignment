//
//  File.swift
//  Ecommerce
//
//  Created by Daniel Magnusson on 1/24/25.
//

import Foundation

class User {
    private var cart: [Product] = []
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func addToCart(_ product: Product) {
        cart.append(product)
    }
    
    func removeProduct(byID id: Int) {
        for (index, item) in cart.enumerated() {
            if item.id == id {
                cart.remove(at: index)
                break
            }
        }
        
        // Alternatively, you could use one of the many
        // collection functions swift provides with a trailing
        // closure, like firstIndex.
        // let index = cart.firstIndex { product in
        //    product.id == id
        //}
        //if let index = index {
        //    cart.remove(at: index)
        //}
    }
    
    func cartTotal() -> Double {
        var total = 0.0
        for product in cart {
            total += product.price
        }
        return total
        
        // Alternatively, you could use a combination
        // of functions in what is called "functional
        // chaining" to transform a collection call by
        // call until it is the correct information.
        // return cart
        //    .map({ $0.price })
        //    .reduce(0, +)
    }
}

extension User {
    func printReceipt() {
        var user: String = "Guest User"
        if self is PremiumUser {
            user = self.name
        }
        print("\(user) Receipt")
        for (index, product) in cart.enumerated() {
            print("\(index+1). \(product.printData())")
        }
        print("\(cartTotal().asDollars())")
        print("")
    }
}

class PremiumUser: User {
    override func cartTotal() -> Double {
        super.cartTotal() * 1.1
    }
}

class GuestUser: User {
    init() {
        super.init(name: "Guest")
    }
    override init(name: String) {
        super.init(name: "Guest")
    }
}
