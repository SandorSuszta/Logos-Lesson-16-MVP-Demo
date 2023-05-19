import Foundation

protocol LessonsPresenterProtocol {
    
    var lessons: [Lesson] { get }
    func fetchLessons()
}
