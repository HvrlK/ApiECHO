//
//  TextViewController.swift
//  ApiECHO
//
//  Created by Vitalii Havryliuk on 9/13/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    //MARK: - Properties
    
    var accessToken: String?
    
    //MARK: - Outlets
    
    @IBOutlet weak var textView: UITextView!
    
    //MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let token = accessToken else {
            return
        }
        ApiECHO.shared.fetchText(accessToken: token) { (text) in
            self.textView.text = text
        }
        
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Counting", let navController = segue.destination as? UINavigationController, let countTableViewController = navController.topViewController as? CountTableViewController else {
            return
        }
        countTableViewController.data = countCharacters(text: textView.text)
    }
    

}


//MARK: - Extensions

extension TextViewController: UINavigationBarDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
}
