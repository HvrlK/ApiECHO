//
//  ViewController.swift
//  ApiECHO
//
//  Created by Vitalii Havryliuk on 9/13/18.
//  Copyright © 2018 Vitalii Havryliuk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    enum FormState {
        case login
        case signup
        case hide
    }
    
    
    //MARK: - Properties
    
    var formState: FormState = .hide
    
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
        nameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
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
            }) { finished in
                self.resetTextFields()
                self.formState = .hide
            }
        }
    }
    
    
    private func resetTextFields() {
        nameTextField.text = nil
        emailTextField.text = nil
        passwordTextField.text = nil
    }
    
    
    private func showAlert(message: String) {
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func loginSignupButtonTapped(_ sender: UIButton) {
        formState = sender.titleLabel?.text == "Log In" ? .login : .signup
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


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            return false
        }
        if let nextField = view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
