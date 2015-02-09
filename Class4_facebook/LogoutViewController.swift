//
//  LogoutViewController.swift
//  Class4_facebook
//
//  Created by Kelly Xu on 2/5/15.
//  Copyright (c) 2015 kelly. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController, UIActionSheetDelegate {
    @IBOutlet weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize (width: 320, height: 1900)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapLogoutBtn(sender: AnyObject) {
        var actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: "Log Out")
        actionSheet.showInView(view)
    }
    
    func actionSheet(actionSheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int){
        if (buttonIndex == 0){
            self.performSegueWithIdentifier("logoutSegue", sender: nil)
        }
    }
    // buttonIndex is 0 for Cancel
    // buttonIndex ranges from 1-n for the other buttons.

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
