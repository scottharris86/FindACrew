//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by scott harris on 2/11/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
   private func updateViews() {
        if let person = person {
            nameLabel.text = person.name
            genderLabel.text = "Gender: \(person.gender)"
            birthYearLabel.text = "Birth year: \(person.birthYear)"
        }
    }
    
}
