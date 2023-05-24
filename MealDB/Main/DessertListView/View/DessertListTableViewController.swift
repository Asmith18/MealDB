//
//  DessertListTableViewController.swift
//  MealDB
//
//  Created by Adam Smith on 5/23/23.
//

import UIKit

class DessertListTableViewController: UITableViewController, DessertListViewModelDelegate {
    
    
    var viewModel: DessertListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DessertListViewModel(delegate: self)
        viewModel.fetchDessertList()
    }
    
    func dessertListHasData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.desserts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dessertCell", for: indexPath) as? DessertListTableViewCell else { return UITableViewCell() }

        let desserts = viewModel.desserts[indexPath.row]
        cell.updateViews(recipe: desserts)

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
