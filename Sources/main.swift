let phone = Product(id: 1, name: "iPhone", category: .electronics, price: 999.99)
let jeans = Product(id: 2, name: "Jeans", category: .clothing, price: 49.99)
let book = Product(id: 3, name: "The Way of Kings", category: .books, price: 29.99)
let charger = Product(id: 4, name: "USB-C Charger", category: .electronics, price: 5.99)

let guest: User = GuestUser()
let premium = PremiumUser(name: "Bernard")

var user = User(name: "Scotty")

guest.payment = .credit(number: "3285122455231123", ccv: 034, expiration: "08/15")
guest.addToCart(phone)

premium.payment = .digital(.applePay(username: "myName", hashedPwd: "pwd"))
premium.addToCart(phone)
premium.addToCart(jeans)
premium.addToCart(book)
premium.addToCart(charger)

// Print receipts
premium.printReceipt()
premium.sortCart(by: .category)
premium.printReceipt()
premium.sortCart(by: .price)
premium.printReceipt()

guest.printReceipt()
