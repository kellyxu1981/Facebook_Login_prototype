//
//  StatusViewController.swift
//  Class4_facebook
//
//  Created by Kelly Xu on 2/8/15.
//  Copyright (c) 2015 kelly. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        myTextField.delegate = self
        [myTextField .becomeFirstResponder()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapCancelBtn(sender: AnyObject) {
        self.myTextField.endEditing(true)
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
