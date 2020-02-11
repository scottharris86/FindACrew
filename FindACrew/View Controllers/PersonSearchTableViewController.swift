//
//  PersonSearchTableViewController.swift
//  FindACrew
//
//  Created by scott harris on 2/11/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        
        cell.genderLabel.text = "Male"
        cell.nameLabel.text = "Scott"
        cell.birthYearLabel.text = "1986"
        
        
        return cell
    }
    
}
