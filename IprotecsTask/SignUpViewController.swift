//
//  SignUpViewController.swift
//  CharliChikenDemoApp
//
//  Created by Hari on 28/01/20.
//  Copyright © 2020 Lancius. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
   
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Design()
        
        }
    

    override func viewWillAppear(_ animated: Bool) {
        self.userNameTF.text = ""
        self.passwordTF.text = ""
        self.confirmPasswordTF.text = ""
    }
    
    // MARK: - Design
    func Design(){
        
        self.userNameView.layer.cornerRadius = self.userNameView.layer.frame.size.height / 2
        self.passwordView.layer.cornerRadius = self.passwordView.layer.frame.size.height / 2
        self.confirmPasswordView.layer.cornerRadius = self.confirmPasswordView.layer.frame.size.height / 2
        self.signUpButton.layer.cornerRadius = self.signUpButton.layer.frame.size.height / 2
    }
    
     // MARK: - ButtonActiones
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        
        let validaction = Validation()
        if validaction == ""
        {
            var loginArray = [NSDictionary]()
            loginArray = getUserDataFromCoreData()
            var randomId = String()
             randomId = String(loginArray.count)
           
          AddUser(userName: self.userNameTF.text!, password: self.passwordTF.text!, userid: randomId)
            self.navigationController?.popViewController(animated: true)
            
        }
        else
        {
        Alert.showBasic(titte: "Alert", massage: validaction, vc: self)
        }
    }
    
    
// MARK: - Validation
    func Validation() -> String {
        var successMessage = ""
        if userNameTF.text?.count == 0
        {
            successMessage = "Please Enter User Name"
            return successMessage
        }
        
        
        if passwordTF.text?.count == 0
        {
            successMessage = "Please Enter Password"
            return successMessage
        }
        if confirmPasswordTF.text?.count == 0
        {
            successMessage = "Please Enter Confirm Password"
            return successMessage
        }
        if passwordTF.text != self.confirmPasswordTF.text {
            successMessage = "Please check once password and Confirm Password"
            return successMessage
        }
        
        return successMessage
    }
    

    
    // MARK: - addCorData
    
    func addCoreData()
    {
        
    }
    
          
   }
