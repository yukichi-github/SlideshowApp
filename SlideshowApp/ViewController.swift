//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 福澤朋裕 on 2017/10/22.
//  Copyright © 2017年 yukichi-github. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 画像の名前の配列
    let imageNameArray = [
        "20170504_525.jpg",
        "20170722_441.jpg",
        "20161112_323.jpg",
        "20161228_094.jpg",
        ]
    var image=UIImage()
    var dispImageNo = 0 // 選択している画像の番号
    var slideShowMode = false // スライドショーモード
    var timer: Timer!
    
    @IBOutlet weak var viewer: UIImageView!
    @IBOutlet weak var button_prev: UIButton!
    @IBOutlet weak var button_next: UIButton!
    @IBOutlet weak var button_play: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewer.isUserInteractionEnabled = true
        displayImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayImage() {
        // 画像の番号が正常な範囲を指しているかチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 3
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 3 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        viewer.image = image
    }
    
    @IBAction func previous_pic(_ sender: Any) {
        dispImageNo = dispImageNo - 1
        displayImage()
    }

    @IBAction func next_pic(_ sender: Any) {
        dispImageNo = dispImageNo + 1
        displayImage()
    }
    
    @IBAction func play_slideshow(_ sender: Any) {
        if slideShowMode {
            //button_prev.isEnabled = true
            button_prev.isHidden = false
            //button_next.isEnabled = true
            button_next.isHidden = false
            button_play.setTitle("Play", for:.normal)
            timer.invalidate()
            slideShowMode = false
        }else{
            //button_prev.isEnabled = false
            button_prev.isHidden = true
            //button_next.isEnabled = false
            button_next.isHidden = true
            button_play.setTitle("Stop", for:.normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(next_pic), userInfo: nil, repeats: true)
            slideShowMode = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let largeViewController:LargeViewController = segue.destination as! LargeViewController

        largeViewController.imageName = imageNameArray[dispImageNo]
    }
    
}

