//
//  NestedLoopViewController.swift
//  HW#31_Nested loop
//
//  Created by Dawei Hao on 2023/7/25.
//

import UIKit

class NestedLoopViewController: UIViewController {

    @IBOutlet weak var patternTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var patternLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        //initial setup number show zero
        numberLabel.text = "0"
        numberLabel.textAlignment = .right

        patternLabelSetup ()
        patternTypeSegmentedControl.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
        patternTypeSegmentedControl.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .selected)
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {

        let sliderValue = Int(sender.value)
        numberLabel.text = String(sliderValue)
        print(sliderValue)

        let number = Int(sender.value)

        numberLabel.text = "\(number)"

        switch patternTypeSegmentedControl.selectedSegmentIndex {
            case 0:
                updateOneLineForSquarePattern(number: number)
            case 1:
                updateForTrianglePattern(number: number)
            case 2:
                updatePyramidPattern(number: number)
            case 3:
                updateDiamondPattern(number: number)
            default:
                break
        }
    }

    func updateOneLineForSquarePattern(number: Int) {
        var content = ""
        for i in 1...number {
            for _ in 1...number {
                if i == 1 {
                    content += "🍏"
                } else {
                    content += "🍎"
                }
            }
            content += "\n"
        }
        patternLabel.text = content
    }

    func updateForTrianglePattern (number: Int) {
        var content = ""

        for i in 1...number {
            for j in 1...number {
                if i > j {
                    content += "🍏"
                } else if i == j && i + j == 10 {
                    content += "🖤"
                } else {
                    content += "🍎"
                }
            }
            content += "\n"
        }
        patternLabel.text = content
    }

    func updatePyramidPattern(number: Int) {
        var content = ""
        for i in 1...number {
            for j in 1...number {
                if j - i >= 5 && i < 5 && i + j > 5 || i + j <= 5 || i >= 6 {
                    content += "🍎"
                } else {
                    content += "🍏"
                }
            }
            content += "\n"
            patternLabel.text = content
        }
    }

    func updateDiamondPattern (number: Int) {
        var content = ""
        var redAppleCount = 1
        for i in 1...number * 2 - 1 {
            for _ in 1...redAppleCount {
                content += "🍎" }

            if i < number {
                redAppleCount += 2
            } else {
                redAppleCount -= 2
            }
            content += "\n"
        }
        // Assuming you have a label named patternLabel
        patternLabel.text = content
    }

        func patternLabelSetup () {
            patternLabel.textAlignment = .center
            patternLabel.numberOfLines = 0
            patternLabel.baselineAdjustment = .alignCenters
            patternLabel.text = "🍎"
        }
}
