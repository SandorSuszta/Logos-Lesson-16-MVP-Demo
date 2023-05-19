//
//  ViewController.swift
//  testtt
//
//  Created by Volodymyr Rykhva on 28.06.2021.
//

import UIKit

final class StudentsViewController: UIViewController {

    @IBOutlet private weak var studentTableView: UITableView!
    
    private lazy var presenter = StudentsPresenter(view: self)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    
        presenter.fetchStudents()
        
        studentTableView.dataSource = self
        studentTableView.delegate = self

        studentTableView.register(
            UINib.init(nibName: StudentTableViewCell.reuseIdentifier, bundle: nil),
            forCellReuseIdentifier: StudentTableViewCell.reuseIdentifier
        )
        studentTableView.tableFooterView = UIView()
        title = "Students"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? StudentDetailsViewController,
           let student = sender as? Student {
            destination.setStudent(student: student)
        }
    }
}

    //MARK: -  StudentsView methods

extension StudentsViewController: StudentsView {
    
    func showStudents(_ students: [Student]) {
        studentTableView.reloadData()
    }
 
    func showStudentDetails(for student: Student) {
        performSegue(withIdentifier: "StudentDetails", sender: student)
    }
}
    //MARK: -  UITableViewDataSource and UITableViewDelegate methods

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentTableViewCell.reuseIdentifier,
                                                 for: indexPath)
        if let cell = cell as? StudentTableViewCell {
            cell.render(student: presenter.students[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectStudent(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
