//
//  LoginViewController.swift
//  CharliChikenDemoApp
//
//  Created by Hari on 28/01/20.
//  Copyright © 2020 Lancius. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

   
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Design()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
          self.userNameTF.text = ""
          self.passwordTF.text = ""
         
      }
    
     // MARK: - Design
    func Design(){
        self.loginView.layer.cornerRadius = 31
        self.userNameView.layer.cornerRadius = 27.5
        self.passwordView.layer.cornerRadius = 27.5
        self.loginBt.layer.cornerRadius = 25
    }
    
    // MARK: - ButtonActiones
    @IBAction func loginBtnAction(_ sender: UIButton) {
      let validaction = self.Validation()
    if validaction == ""
    {
        self.getoHomepage()
    }
    else
    {
        Alert.showBasic(titte: "Alert", massage: validaction, vc: self)
    }
    }
    
    @IBAction func signBtnAction(_ sender: UIButton) {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewControllerId") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
        return successMessage
    }
   
    
    func getoHomepage(){
        var loginArray = [NSDictionary]()
        loginArray = getUserDataFromCoreData()
        var userName = NSString()
        var password = NSString()
        userName =  self.userNameTF.text! as NSString
        password =  self.passwordTF.text! as NSString
        for item in loginArray
        {
            let userNameStr = item["userName"] as! NSString
            if userName == userNameStr
            {
                let passwordStr = item["password"] as! NSString
                if password == passwordStr
                {
                    let userID = item["userid"] as! NSString
                     UserDefaults.standard.set(userID, forKey: "USERID")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewControllerId") as! HomeViewController
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                    
                }else{
                    Alert.showBasic(titte: "Alert", massage: "Enter  Correct Logins", vc: self)
                }
            }
        
        }

        
    }

}
