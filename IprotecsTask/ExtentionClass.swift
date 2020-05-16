//
//  StringExtention.swift
//  SwiftlearningProject
//
//  Created by Kardas Veeresham on 2/8/19.
//  Copyright © 2019 lancius. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Alert only Ok Button

class Alert  {
    class func showBasic(titte:String, massage:String, vc:UIViewController ){
        let alert = UIAlertController(title: titte, message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert,animated: true)
        
    }

}


//MARK: - UIAlert   ok and Cancel button

extension UIViewController
{
    func popUpAlert(title: String, message: String, actionTitle: [String],actionStyle: [UIAlertAction.Style], action:[((UIAlertAction) -> Void)]){
        let alert = UIAlertController(title: title, message: message, preferredStyle:  .alert)
        for (index,title) in actionTitle.enumerated(){
            let action = UIAlertAction(title: title, style: actionStyle[index], handler: action[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
}



//MARK: - UIColor

extension UIColor {

    static let customlightGray = UIColor.init(red: 145.0/255, green: 145.0/255, blue: 145.0/255, alpha: 1).cgColor
    
    convenience init(red: Int, green: Int, blue: Int, a:CGFloat = 1.0){
        
        self.init(
            red: CGFloat(red)/255.0,
            green: CGFloat(green)/255.0,
            blue: CGFloat(blue)/255.0,
            alpha: a
            
        )
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0){
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
    
}














