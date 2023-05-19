import Foundation

class LessonsPresenter: LessonsPresenterProtocol {
    
    private weak var view: LessonsView?
    var lessons: [Lesson] = []
    
    init(view: LessonsView) {
        self.view = view
    }
    
    func fetchLessons() {
        lessons = JsonService.shared.parseLessons()?.lessons ?? []
        view?.showLessons(lessons)
    }
}
