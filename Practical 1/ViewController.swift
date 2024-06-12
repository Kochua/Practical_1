//
//  ViewController.swift
//  Practical 1
//
//  Created by Tako Metonidze on 12.06.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  var tableview = UITableView()
  var userProfiles = UserProfile.sampleData()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableview.dataSource = self
    tableview.delegate = self
    view.addSubview(tableview)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userProfiles.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = CollectionViewController()
    navigationController?.pushViewController(vc, animated: false)
  }
}


