let phone = Product(id: 1, name: "iPhone", category: .electronics, price: 999.99)
let jeans = Product(id: 2, name: "Jeans", category: .clothing, price: 49.99)

let guest = GuestUser()
let premium = PremiumUser(name: "Bernard")

guest.addToCart(phone)

premium.addToCart(phone)
premium.addToCart(jeans)

// Print receipts
guest.printReceipt()
premium.printReceipt()
