//
//  SignUpViewController.swift
//  Shelter
//
//  Created by Jismi Jesmani on 4/13/23.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {

    @IBOutlet var fNTextField: UITextField!
    @IBOutlet var lnTextField: UITextField!
    @IBOutlet var pNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var cPasswordTextField: UITextField!
    @IBOutlet var haveAccountButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the UITextField delegate
        fNTextField.delegate = self
        lnTextField.delegate = self
        pNumberTextField.delegate = self
        passwordTextField.delegate = self
        cPasswordTextField.delegate = self
        
        // Dismiss the keyboard when tapping outside the UITextField
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = true
        tapGesture.delegate = self // Set the UITapGestureRecognizer delegate
        view.addGestureRecognizer(tapGesture)
        
        // Set the text alignment of the UIButton to left
        haveAccountButton.contentHorizontalAlignment = .left
        
        // Set the title of the UIButton with different font styles
        let part1 = "Already have an account? "
        let part2 = "Log In here"
        let part1Attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17) // Change the font size if needed
        ]
        let part2Attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17, weight: .heavy) // Use a heavier font weight
        ]
        let attributedTitle = NSMutableAttributedString(string: part1, attributes: part1Attributes)
        attributedTitle.append(NSAttributedString(string: part2, attributes: part2Attributes))
        
        haveAccountButton.setAttributedTitle(attributedTitle, for: .normal)
        
        signUpButton.layer.cornerRadius = 25
        signUpButton.layer.masksToBounds = true
        
        let signUpButtonText = "Sign Up"
        let attributedTitleTwo = NSMutableAttributedString(string: signUpButtonText, attributes: part2Attributes)
        signUpButton.setAttributedTitle(attributedTitleTwo, for: .normal)
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is UIControl {
            return false
        }
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
