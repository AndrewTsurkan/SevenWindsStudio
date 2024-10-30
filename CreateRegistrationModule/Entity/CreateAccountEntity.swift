import Foundation

struct CreateAccountEntity: Codable {
    var token: String
    var tokenLifetime: Int
}
