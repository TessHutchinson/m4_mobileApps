//
//  ViewController.swift
//  m4
//
//  Created by Vanessa.Hutchinson on 2026-06-14.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var moodDatePicker: UIDatePicker!
    @IBOutlet weak var savedEntryLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateMoodLabel(for: moodSlider.value)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateMoodLabel(for: sender.value)
    }
    
    func updateMoodLabel(for value: Float) {
        let moodValue = Int(value)
        
        switch moodValue {
        case 0...20:
            moodLabel.text = "Very Sad 😥"
        case 21...40:
            moodLabel.text = "Sad 🙁"
        case 41...60:
            moodLabel.text = "Neutral 😕"
        case 61...80:
            moodLabel.text = "Happy 🙂"
        default:
            moodLabel.text = "Very Happy 😃"
        }
    }
    
    @IBAction func saveMoodTapped(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        let dateString = dateFormatter.string(from: moodDatePicker.date)
        
        let emoji = moodLabel.text?.split(separator: " ").last ?? ""
        
        savedEntryLabel.text = "On \(dateString), you felt \(emoji)"
    }


}

