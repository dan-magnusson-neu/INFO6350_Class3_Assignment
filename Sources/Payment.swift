enum PaymentMethod {
    case cash
    case credit(number: String, ccv: Int, expiration: String)
    case digital(DigitalProvider)
    enum DigitalProvider {
        case paypal(username: String, hashedPwd: String)
        case applePay(username: String, hashedPwd: String)
        case googlePay(username: String, hashedPwd: String)
        case square(username: String, hashedPwd: String)
    }
}
