//
//  LoginViewController.swift
//  Class4_facebook
//
//  Created by Kelly Xu on 2/5/15.
//  Copyright (c) 2015 kelly. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var formView: UIView!
//    @IBOutlet weak var loginTextFieldView: UIView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginBtn.enabled = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func emailChanged(sender: AnyObject) {
        textChanged ()
    }
    @IBAction func passwordChanged(sender: AnyObject) {
        textChanged ()
    }
    
//    @IBAction func onEditBegin(sender: AnyObject) {
//        UIView .animateWithDuration(0.2, animations: { () -> Void in
//            self.loginTextFieldView.center.y -= 20
//        })
//    }
    
    func textChanged (){
        if (emailTextField.text.isEmpty || passwordTextField.text.isEmpty){
            loginBtn.enabled = false;
        }else {
            loginBtn.enabled = true;
        }
    }
    
    @IBAction func onTapLoginBtn(sender: AnyObject) {
        
        if (emailTextField.text == "kxu@gmail.com" && passwordTextField.text == "123456"){
            
            loginBtn.selected = true
            activityView.startAnimating()
            delay(1, { () -> () in
               self.performSegueWithIdentifier("loginSegue", sender: nil)
            })
            
        }else{
            activityView.startAnimating()
            delay(1, { () -> () in
                var alertView = UIAlertView(title: "Opps!", message: "Wrong email or passwrod", delegate: nil, cancelButtonTitle: "OK")
                alertView.show()
                self.activityView.stopAnimating()
            })
        }
    }
    

    @IBAction func onTapGesture(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        UIView .animateWithDuration(1, animations: { () -> Void in
            self.formView.center.y -= 35
        })
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        UIView .animateWithDuration(1, animations: { () -> Void in
            self.formView.center.y += 35
        })
    }

}
