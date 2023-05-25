//
//  RecipeDetailsViewController.swift
//  MealDB
//
//  Created by Adam Smith on 5/25/23.
//

import UIKit

class DessertDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var dessertImageView: UIImageView!
    @IBOutlet weak var dessertIngredientsTableView: UITableView!
    @IBOutlet weak var dessertInstructions: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
