//
//  ViewController.swift
//  Table-Research
//
//  Created by Ominext on 3/12/20.
//  Copyright © 2020 Ominext. All rights reserved.
//


import UIKit

class BadTableViewController: UIViewController {
  
  // MARK: - Instance Vars
  @IBOutlet weak var tableView: UITableView!
  
  // NOTE: - Creating a var to hold all cells is bad, takes up too much memory
  var cells: [UITableViewCell] = []
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    cellsSetup()
    tableViewSetup()
  }
  
}

// MARK: - Setup
extension BadTableViewController {
  
  // NOTE: - Here we pre-create all the cells we need and add them to the cells array. Not good!
  func cellsSetup() {
    for _ in 0...10000 {
      let cell = UITableViewCell()
      cell.textLabel?.text = "Wow so bad"
      cells.append(cell)
    }
  }
  
  func tableViewSetup() {
//    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 350
  }
  
}

// MARK: - Table View Delegate
extension BadTableViewController: UITableViewDelegate {
  
}

// MARK: - Table View Data Source
extension BadTableViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cells.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // NOTE: - Now we only need to specify a cell from the array based on index, but not worth it
    let cell = tableView.dequeueReusableCell(withIdentifier: "BetterTableViewCell")
    cell?.textLabel?.text = "Wow much better"
//    let cell = cells[indexPath.row]
    return cell!
  }
  
}
