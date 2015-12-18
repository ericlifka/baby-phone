//
//  ViewController.swift
//  baby phone
//
//  Created by Eric Lifka on 12/16/15.
//  Copyright © 2015 Pookums & Pookums LTD. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var beepsound : AVAudioPlayer?
    var ringsound : AVAudioPlayer?
    var endsound : AVAudioPlayer?
    var hellosound : AVAudioPlayer?
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let beepsound = self.setupAudioPlayerWithFile("beep9", type:"mp3") {
            self.beepsound = beepsound
        }
        if let ringsound = self.setupAudioPlayerWithFile("phone-ringtone", type:"mp3") {
            self.ringsound = ringsound
        }
        if let endsound = self.setupAudioPlayerWithFile("glass1", type:"mp3") {
            self.endsound = endsound
        }
        if let hellosound = self.setupAudioPlayerWithFile("hello", type: "m4a"){
            self.hellosound = hellosound
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    @IBAction func beepSound(sender: AnyObject) {
        beepsound?.play()
    }
    
    
    
    @IBAction func ringSound(sender: UIButton) {
        ringsound?.play()
        NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: "playhelloafterringtone", userInfo: nil, repeats: false)
    
    }
    
    func playhelloafterringtone(){
      hellosound?.play()
    }
    
    @IBAction func endSound(sender: AnyObject) {
        endsound?.play()
    }
    
    
}
