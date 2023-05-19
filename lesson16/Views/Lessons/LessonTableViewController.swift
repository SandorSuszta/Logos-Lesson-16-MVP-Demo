//
//  LessonTableViewController.swift
//  testtt
//
//  Created by Volodymyr Rykhva on 28.06.2021.
//

import UIKit

final class LessonTableViewController: UITableViewController {
   
    private lazy var presenter: LessonsPresenterProtocol = LessonsPresenter(view: self)

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Lessons"
        presenter.fetchLessons()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.lessons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonsTableViewCell", for: indexPath)
        cell.textLabel?.text = presenter.lessons[indexPath.row].name
        cell.detailTextLabel?.text = presenter.lessons[indexPath.row].hours
        return cell
    }
}

extension LessonTableViewController: LessonsView {
    
    func showLessons(_ lessons: [Lesson]) {
        tableView.reloadData()
    }
}
