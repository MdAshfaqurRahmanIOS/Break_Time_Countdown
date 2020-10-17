//
//  ViewController.swift
//  Break_Time_Countdown
//
//  Created by Md Ashfaqur Rahman on 17/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countdownProgress: UIProgressView!
    
    var progressCounter = 1
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func allActionButton(_ sender: UIButton) {
        if sender.tag == 1 {
            print("Tea Button press")
            progressCounter = 1
            timer.invalidate()
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                
                print(self.progressCounter)
                let result = Float(self.progressCounter) / Float(10)
                print(result)
                
                
                
                if self.progressCounter == 10 {
                    self.timer.invalidate()
                }
                self.progressCounter += 1
                self.countdownProgress.progress = result
            }
            
            
            
            
            
            
            
//            for a in 1...10 {
//                let result = Float(a) / Float(10)
//                sleep(1)
//                print(result)
//                countdownProgress.progress = result
//            }
            // countdownProgress.progress = 1.0
            // 1.0 0.0
            // 0.1 = 10%  1 / 10 = 0.1
            // 0.2 = 20%  2 /10 = 0.2
            
        } else {
            print("Lunch Button press")
            countdownProgress.progress = 0.5
            
        }
    }
    
}

