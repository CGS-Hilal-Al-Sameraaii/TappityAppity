//
//  ViewController.swift
//  TappityAppity
//
//  Created by Madoge on 29/5/17.
//  Copyright © 2017 Madoc Cottle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var time = 30
    var taps = 0
    var gameStarted = false
    var gameOver = false
    
    @IBAction func tapped() {
        //Triggers multiple times (kinda)
        if gameStarted == false {
            startTimer()
            gameStarted = true
        }
        if gameOver != true {
            taps += 1
            displayLabel.text = "\(taps)"
        } else {
            self.alertThisStuff()
        }
    }
    
    func startTimer() {
        let _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            if self.time > 0 {
                self.time -= 1
                self.timerLabel.text = "\(self.time)"
            } else {
                self.gameOver = true
            }
        }
    }
    
    func alertThisStuff() {
        let alertController = UIAlertController(title: "Game Over", message: "Score: \(taps)", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default) {
            UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!

}
