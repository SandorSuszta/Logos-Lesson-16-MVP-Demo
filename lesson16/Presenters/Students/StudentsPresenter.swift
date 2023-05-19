import Foundation

final class StudentsPresenter: StudentsPresenterProtocol {

    private weak var view: StudentsView?
    
    var students: [Student] = []
    
    //MARK: - Init
    
    init(view: StudentsView) {
        self.view = view
    }
    
    //MARK: - Methods
    
    func fetchStudents() {
        students = JsonService.shared.parseStudents()?.students ?? []
        view?.showStudents(students)
    }
    
    func didSelectStudent(at indexPath: IndexPath) {
        view?.showStudentDetails(for: students[indexPath.row])
    }
}
