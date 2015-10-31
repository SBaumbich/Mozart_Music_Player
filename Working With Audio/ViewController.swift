//
//  ViewController.swift
//  Working With Audio
//
//  Created by Scott Baumbich on 10/30/15.
//  Copyright © 2015 Scott Baumbich. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    @IBOutlet var slider: UISlider!
    @IBOutlet var playBackSlider: UISlider!
    
    
    @IBAction func Play(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func ChangeVolume(sender: AnyObject) {
        player.volume = slider.value
    }
    
    @IBAction func stop(sender: AnyObject) {
        player.pause()
        prepAudioFile()
    }
    
    @IBAction func audioPlaybackSlide(sender: AnyObject) {
        player.currentTime = NSTimeInterval(playBackSlider.value)
        player.prepareToPlay()
        player.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        prepAudioFile()
        playBackSlider.maximumValue = Float(player.duration)
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateslider"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func prepAudioFile(){
        let audioPath = NSBundle.mainBundle().pathForResource("mozartAudio", ofType: "mp3")!
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
        } catch {
            // Process error line
        }
    }
    
    func updateslider() {
        playBackSlider.value = Float(player.currentTime)
        NSLog("slider update")
    }

}

