import Foundation

protocol StudentsPresenterProtocol {
    
    var students: [Student] { get }
    
    func fetchStudents()
    func didSelectStudent(at indexPath: IndexPath)
}
