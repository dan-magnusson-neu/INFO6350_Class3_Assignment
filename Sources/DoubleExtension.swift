import Foundation
extension Double {
    func asDollars() -> String {
        return "$\((String(format: "%.2f", self)))"
    }
}
