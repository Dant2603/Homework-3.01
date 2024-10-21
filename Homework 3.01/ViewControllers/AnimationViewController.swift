//
//  ViewController.swift
//  Homework 3.01
//
//  Created by Мария Гетманская on 21.10.2024.
//

import UIKit
import SpringAnimation

final class AnimationViewController: UIViewController {

    @IBOutlet var animatedView: SpringView!
    @IBOutlet var animationDetailsLabel: UILabel!
    @IBOutlet var runAnimationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runAnimationButton.titleLabel?.text = "Run Animation"
    }

    @IBAction func runAnimationButtonTapped(_ sender: SpringButton) {
        sender.animation = "pop"
        sender.duration = 0.1
        sender.animate()
        
        
        animatedView.animation = AnimationPreset.allCases.randomElement()?.rawValue ?? "pop"
        animatedView.force = 1
        animatedView.animate()
        animationDetailsLabel.text = animatedView.animation
        
    }

}

