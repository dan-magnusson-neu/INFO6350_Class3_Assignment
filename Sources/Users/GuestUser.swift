class GuestUser: User {
    init() {
        super.init(name: "Guest")
    }
    override init(name: String) {
        super.init(name: "Guest")
    }
}
