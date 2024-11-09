import Foundation

struct CreateAccountEntity: Codable {
    let token: String?
    let tokenLifetime: Int?
}
