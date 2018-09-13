//
//  CountTableViewController.swift
//  ApiECHO
//
//  Created by Vitalii Havryliuk on 9/13/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class CountTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var data: [Character : Int] = [:]
    var characters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        characters = Array(data.keys).sorted()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountCell", for: indexPath)
        let character = characters[indexPath.row]
        if let count = data[character] {
            cell.textLabel?.text = "' \(character.description) '" + " - " + count.description + " times"
        }
        return cell
    }
    
    //MARK: - Actions
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}
