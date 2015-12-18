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
    
    @IBOutlet var buttonstuff: [UIButton]!
    
    var audioPlayer = AVAudioPlayer()
    var beepsound : AVAudioPlayer?
    var ringsound : AVAudioPlayer?
    var endsound : AVAudioPlayer?
    var hellosound : AVAudioPlayer?
    var dogsound : AVAudioPlayer?
    var catsound : AVAudioPlayer?
    var pigsound : AVAudioPlayer?
    var horsesound : AVAudioPlayer?
    var sheepsound : AVAudioPlayer?
    var elephantsound : AVAudioPlayer?
    var cowsound : AVAudioPlayer?
    var birdsound : AVAudioPlayer?
    var ducksound : AVAudioPlayer?
    
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
        if let dogsound = self.setupAudioPlayerWithFile("dog", type:"mp3") {
            self.dogsound = dogsound
        }
        if let catsound = self.setupAudioPlayerWithFile("meow", type: "aiff"){
            self.catsound = catsound
        }
        if let pigsound = self.setupAudioPlayerWithFile("pig", type:"mp3") {
            self.pigsound = pigsound
        }
        if let cowsound = self.setupAudioPlayerWithFile("cow", type:"mp3") {
            self.cowsound = cowsound
        }
        if let horsesound = self.setupAudioPlayerWithFile("horse", type: "mp3"){
            self.horsesound = horsesound
        }
        if let elephantsound = self.setupAudioPlayerWithFile("elephant", type:"mp3") {
            self.elephantsound = elephantsound
        }
        if let sheepsound = self.setupAudioPlayerWithFile("sheep", type: "mp3"){
            self.sheepsound = sheepsound
        }
        if let birdsound = self.setupAudioPlayerWithFile("bird", type:"mp3") {
            self.birdsound = birdsound
        }
        if let ducksound = self.setupAudioPlayerWithFile("duck", type: "mp3"){
            self.ducksound = ducksound
        }
    
        for button in buttonstuff {
            button.layer.shadowOpacity = 1.0
            button.layer.shadowOffset = CGSize.init(width: 7, height: 7)
            button.layer.shadowColor = UIColor.blackColor().CGColor
            button.layer.shadowRadius = 10
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    @IBAction func beepSound(sender: AnyObject) {
        beepsound?.play()
    }
    
    
    @IBAction func dog(sender: AnyObject) {
        dogsound?.play()
    }
    
    @IBAction func cat(sender: AnyObject) {
        catsound?.play()
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
    
    @IBAction func elephant(sender: AnyObject) {
        elephantsound?.play()
    }
    
    
    @IBAction func pig(sender: AnyObject) {
        pigsound?.play()
    }
    
    @IBAction func horse(sender: AnyObject) {
        horsesound?.play()
    }
    
    @IBAction func sheep(sender: AnyObject) {
        sheepsound?.play()
    }
    
    @IBAction func cow(sender: AnyObject) {
        cowsound?.play()
    }
    
    @IBAction func bird(sender: AnyObject) {
        birdsound?.play()
    }
    
    @IBAction func duck(sender: AnyObject) {
        ducksound?.play()
    }
}
