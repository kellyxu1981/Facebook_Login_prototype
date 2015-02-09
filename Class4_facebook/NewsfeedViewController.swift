//
//  NewsfeedViewController.swift
//  Class4_facebook
//
//  Created by Kelly Xu on 2/5/15.
//  Copyright (c) 2015 kelly. All rights reserved.
//

import UIKit

class NewsfeedViewController: UIViewController {
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
            
            refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
            scrollView.insertSubview(refreshControl, atIndex: 0)
        
        contentView.alpha = 0
        activityView.startAnimating()
        // Do any additional setup after loading the view.
        delay(1, { () -> () in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.contentView.alpha = 1
            })
            self.activityView.stopAnimating()
            self.scrollView.contentSize = CGSize (width: 320, height: 1025)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func onRefresh() {
        delay(0.5, closure: {
            self.refreshControl.endRefreshing()
        })
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
