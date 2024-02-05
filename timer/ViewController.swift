//
//  ViewController.swift
//  timer
//
//  Created by nstudent on 2/5/24.
//

import UIKit

class ViewController: UIViewController {
    var seconds = 0;
    var minutes = 0;
    var hours = 0;
    var timer = Timer();
    @IBOutlet weak var timerLabel: UILabel!;
    
    @IBAction func setTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true);
    }
    
    
    @IBAction func stopTimer(_ sender: UIButton) {
        timer.invalidate();
    }
    
    
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate();
        seconds = 0;
        minutes = 0;
        hours = 0;
        timerLabel.text = "00:00:00";
    }
    
    @objc func updateTimer(){
        seconds += 1;
        
        if(seconds == 60){
            seconds = 0;
            minutes += 1;
        }
        if(minutes == 60){
            minutes = 0;
            hours += 1;
        }
        let secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)";
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)";
        let hoursString = hours > 9 ? "\(hours)" : "0\(hours)";
        timerLabel.text = "\(hoursString):\(minutesString):\(secondString)";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
    }

}

/*import UIKit
 import AVFoundation

 class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
     
     var seconds = 0
     var minutes = 0
     var hours = 0
     var timer = Timer()
     var player: AVAudioPlayer?
     
     @IBOutlet weak var timerLabel: UILabel!
     @IBOutlet weak var secondsPicker: UIPickerView!
     @IBOutlet weak var minutesPicker: UIPickerView!
     @IBOutlet weak var hoursPicker: UIPickerView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         secondsPicker.delegate = self
         secondsPicker.dataSource = self
         minutesPicker.delegate = self
         minutesPicker.dataSource = self
         hoursPicker.delegate = self
         hoursPicker.dataSource = self
     }
     
     @IBAction func startTimer(_ sender: UIButton) {
         let duration = TimeInterval(seconds + minutes * 60 + hours * 3600)
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
         DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
             self.playSound()
         }
     }
     
     @IBAction func pauseTimer(_ sender: UIButton) {
         timer.invalidate()
     }
     
     @IBAction func resetTimer(_ sender: UIButton) {
         timer.invalidate()
         seconds = 0
         minutes = 0
         hours = 0
         timerLabel.text = "00:00:00"
     }
     
     @objc func updateTimer() {
         seconds -= 1
         if seconds < 0 {
             seconds = 59
             minutes -= 1
         }
         if minutes < 0 {
             minutes = 59
             hours -= 1
         }
         if hours < 0 {
             hours = 0
             minutes = 0
             seconds = 0
             timer.invalidate()
             playSound()
         }
         let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
         let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
         let hoursString = hours > 9 ? "\(hours)" : "0\(hours)"
         timerLabel.text = "\(hoursString):\(minutesString):\(secondsString)"
     }
     
     func playSound() {
         guard let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") else { return }
         do {
             try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
             try AVAudioSession.sharedInstance().setActive(true)
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
             guard let player = player else { return }
             player.play()
         } catch let error {
             print(error.localizedDescription)
         }
     }
     
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         switch pickerView {
         case secondsPicker:
             return 60
         case minutesPicker:
             return 60
         case hoursPicker:
             return 24
         default:
             return 0
         }
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return "\(row)"
     }
     
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         switch pickerView {
         case secondsPicker:
             seconds = row
         case minutesPicker:
             minutes = row
         case hoursPicker:
             hours = row
         default:
             break
         }
     }
 }
*/

