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
    
    var personController = PersonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personController.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        
        let person = personController.people[indexPath.row]
        
        cell.person = person
        
        return cell
        
    }
    
}

extension PersonSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        personController.searchForPeopleWith(searchTerm: searchTerm) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
}
