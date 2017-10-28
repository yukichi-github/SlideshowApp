//
//  LargeViewController.swift
//  SlideshowApp
//
//  Created by 福澤朋裕 on 2017/10/22.
//  Copyright © 2017年 yukichi-github. All rights reserved.
//

import UIKit

class LargeViewController: UIViewController {

    var imageName:String!
    
    @IBOutlet weak var LargeImageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let image = UIImage(named: imageName)
        LargeImageView.image = image
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
