class PremiumUser: User {
    override func cartTotal() -> Double {
        super.cartTotal() * 0.9
    }
}
