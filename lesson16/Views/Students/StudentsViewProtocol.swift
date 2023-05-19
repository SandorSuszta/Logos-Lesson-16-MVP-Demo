import Foundation

protocol StudentsView: AnyObject {
    func showStudents(_ students: [Student])
    func showStudentDetails(for student: Student)
}
