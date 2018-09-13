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
    
    @IBOutlet weak var loginSignupStackView: UIStackView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var formStackView: UIStackView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signFormButton: UIButton!

    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeButton(loginButton)
        customizeButton(signupButton)
        customizeButton(signFormButton)
        formStackView.alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideForm))
        view.addGestureRecognizer(tap)
    }
    

    private func customizeButton(_ button: UIButton) {
        button.layer.cornerRadius = ButtonConstants.cornerRadius
        button.backgroundColor = ButtonConstants.backgroundColor
        button.setTitleColor(ButtonConstants.textColor, for: .normal)
    }
    
    
    private func showForm() {
        UIView.animate(withDuration: 0.5, animations: {
            self.loginSignupStackView.alpha = 0
        }) { finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.formStackView.alpha = 1
            })
        }
    }

    
    @objc func hideForm() {
        UIView.animate(withDuration: 0.5, animations: {
            self.formStackView.alpha = 0
        }) { finished in
            UIView.animate(withDuration: 0.5, animations: {
                self.loginSignupStackView.alpha = 1
            })
        }
    }
    
    
    //MARK: - Actions
    
    @IBAction func loginSignupButtonTapped(_ sender: UIButton) {
        nameTextField.isHidden = sender.titleLabel?.text == "Log In"
        signFormButton.setTitle(sender.titleLabel?.text == "Log In" ? "Log In" : "Sign Up", for: .normal)
        showForm()
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
