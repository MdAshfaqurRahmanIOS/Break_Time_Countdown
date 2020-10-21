//
//  ViewController.swift
//  Break_Time_Countdown
//
//  Created by Md Ashfaqur Rahman on 17/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var breakNameLabel: UILabel!
    @IBOutlet weak var currentDateViewLabel: UILabel!
    @IBOutlet weak var countdownTimer: UILabel!
    @IBOutlet weak var countdownProgress: UIProgressView!
    @IBOutlet weak var progressPercentace: UILabel!
    @IBOutlet weak var statusNotify: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    
    
    var dict = ["Tea": 45, "Lunch": 60]
    var totlaTimeINMinute = 0
    var totalTimeInSecont = 0
    var progressCounter = 1
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateClassView = Date()
        let choicenFormet = DateFormatter()
        choicenFormet.dateStyle = .medium
        
        let finalDateView = choicenFormet.string(from: dateClassView)
        currentDateViewLabel.text = finalDateView
        
    }
    
    @IBAction func allActionButton(_ sender: UIButton) {
        
        if sender.tag == 1 {
            print("Take your Tea Properly")
            statusNotify.text = "Take your Tea Properly"
            backgroundImage.image = #imageLiteral(resourceName: "Tea")
            
        } else {
            print("Take your Lunch Properly")
            statusNotify.text = "Take your Lunch Properly"
            backgroundImage.image = #imageLiteral(resourceName: "Lunch")
        }
        
        breakNameLabel.text = "\(sender.currentTitle!) Break Time"
        
        
        let timeDuration = dict[sender.currentTitle!]!
        
        totlaTimeINMinute = timeDuration
        totalTimeInSecont = 60
        progressCounter = 1
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            
            let result = Float(self.progressCounter) / Float(timeDuration*60)
            
            if self.progressCounter == timeDuration*60 {
                self.timer.invalidate()
            } else if self.totalTimeInSecont == 0 || self.totlaTimeINMinute == timeDuration{
                self.totlaTimeINMinute -= 1
                self.totalTimeInSecont = 60
            }
            
            
            self.progressCounter += 1
            self.totalTimeInSecont -= 1
            
            self.countdownTimer.text = "\(self.totlaTimeINMinute).\(self.totalTimeInSecont)"
            
            self.countdownProgress.progress = result
            self.progressPercentace.text = "\(String(format: "%.2f", result*100))%"
            
            
                        
        }
    }
    
}
