//
//  NestedLoopSquareViewController.swift
//  HW#31_Nested loop
//
//  Created by Dawei Hao on 2023/7/31.
//

import UIKit

class NestedLoopSquareViewController: UIViewController {
    @IBOutlet weak var patternTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var patternLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var valueSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        //initial setup number show zero
        numberLabel.text = "0"
        numberLabel.textAlignment = .right

        patternLabelSetup ()

        patternTypeSegmentControl.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        patternTypeSegmentControl.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .selected)
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        //type annotation
        let sliderValue = Int(sender.value)
        numberLabel.text = String(sliderValue)
        print("\(sliderValue)")

        //create a constant for slider's sender.value
        let number = Int(sender.value)
        //use the if else to distinguish the segmentControl's value
        if patternTypeSegmentControl.selectedSegmentIndex == 0 {
            squarePattern(number: number)
        } else if patternTypeSegmentControl.selectedSegmentIndex == 1 {
            diagonalPattern(number: number)
        } else if patternTypeSegmentControl.selectedSegmentIndex == 2 {
            diagonalSecondPattern(number: number)
        } else if patternTypeSegmentControl.selectedSegmentIndex == 3 {
            coverPattern(number: number)
        } else if patternTypeSegmentControl.selectedSegmentIndex == 4 {
            fillDifferentPattern(number: number)
        }
    }

    func squarePattern(number: Int) {
        var content = ""
        for _ in 1...number {
            for _ in 1...number {
                content += "🌸"
            }
            //change to the next line when the for loop runs once
            content += "\n"
        }
        //let patternLabel.text stored in content
        patternLabel.text = content
    }

    func diagonalPattern(number: Int) {
        var content = ""
        for i in 1...number {
            for j in 1...number {
                if i == j {
                    content += "🌸"
                } else {
                    content += "🌺"
                }
            }
            //When for loop runs spacing content again~
            content += "\n"
        }
        //Let content's string stored in patterLabel.text
        patternLabel.text = content
    }

    func diagonalSecondPattern(number: Int) {
        var content = ""
        for i in 1...number {
            for j in 1...number {
                if i == j || i + j == number + 1 {
                    content += "🌺"
                } else {
                    content += "🌸"
                }
            }
            //When for loop runs spacing content again~
            content += "\n"
            //Let content's string stored in patterLabel.text
            patternLabel.text = content
        }
    }

    func coverPattern(number: Int) {
        var content = ""
        for i in 1...number {
            for j in 1...number {
                if i == 1 || j == 1 || i == number || j == number {
                    content += "🌺"
                } else {
                    content += "🌸"
                }
            }
            //When for loop runs spacing content again~
            content += "\n"
            //Let content's string stored in patterLabel.text
            patternLabel.text = content
        }
    }

    func fillDifferentPattern(number: Int) {
        let roles = ["🍄", "🌺", "🌸", "🌼", "🌻", "🌿", "☘️", "🍀", "🪴", "🍁"]
           var content = ""
        for role in roles {
            for _ in 1...number {
                content += role
            }
            //When for loop runs spacing content again~
            content += "\n"
            //Let content's string stored in patterLabel.text
            patternLabel.text = content
        }
     }

    func patternLabelSetup () {
        patternLabel.textAlignment = .center
        patternLabel.numberOfLines = 0
        patternLabel.baselineAdjustment = .alignCenters
        patternLabel.text = "🌸"
    }
}
