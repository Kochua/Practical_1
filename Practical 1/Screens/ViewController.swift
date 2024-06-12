//
//  ViewController.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate {
    var userProfiles = UserProfile.sampleData()
    
    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
  override func viewDidLoad() {
    super.viewDidLoad()
      
    setup()
    setupConstraint()
  }
    
    private func setup() {
      tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
      view.addSubview(tableView)
    }
    
    private func setupConstraint() {
      tableView.snp.remakeConstraints { make in
        make.edges.equalToSuperview()
      }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return userProfiles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.configure(with: userProfiles[indexPath.row])
        
      return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let vc = CollectionViewController()
      navigationController?.pushViewController(vc, animated: false)
    }
}

