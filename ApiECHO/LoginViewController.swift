//
//  ViewController.swift
//  ApiECHO
//
//  Created by Vitalii Havryliuk on 9/13/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!

    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeButton(loginButton)
        customizeButton(signupButton)
    }
    

    private func customizeButton(_ button: UIButton) {
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.backgroundColor = ButtonConstants.backgroundColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
    }

}


//MARK: - Extensions

extension LoginViewController {
    
    struct ButtonConstants {
        static let cornerRadius: CGFloat = 8.0
        static let backgroundColor: UIColor = UIColor.purple
        static let textColor: UIColor = UIColor.white
    }
    
}
