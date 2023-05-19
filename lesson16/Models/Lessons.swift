import Foundation

struct Lessons: Codable {
    let lessons: [Lesson]
}

struct Lesson: Codable {
    let name: String
    let hours: String
}
