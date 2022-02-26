//
//  UIViewController.swift
//  SecureKey_Interview
//
//  Created by Dheeraj's MacBook Pro on 2022-02-26.
//

import UIKit

extension UIViewController: UITextFieldDelegate, UITextViewDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
