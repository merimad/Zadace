//
//  UserViewController.swift
//  LocationAndMaps
//
//  Created by Merima on 10/26/16.
//  Copyright © 2016 ena. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var currentUser = User()

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageView: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        topView.backgroundColor = UIColor(red: 87/255, green: 138/255, blue: 163/255, alpha: 1)
        imageView.image = UIImage(named:"Image\(arc4random_uniform(2)+1)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
