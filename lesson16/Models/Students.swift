import Foundation

struct Students: Codable {
    let students: [Student]
}

struct Student: Codable {
    let name: String
    let email: String
    let logo: URL
}
