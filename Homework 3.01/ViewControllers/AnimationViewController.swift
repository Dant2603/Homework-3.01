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
    
    private var activeAnimation: RandomAnimation?
    private var nextAnimation: RandomAnimation?
    
    private let animationManager = AnimationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activeAnimation = animationManager.getRandomAnimation()
        runAnimationButton.setTitle("Run", for: .normal)
        updateAnimationDetailsLabel()
    }

    @IBAction func runAnimationButtonTapped(_ sender: SpringButton) {
        runNextAnimation()
    }
    
    private func runNextAnimation() {
        guard let animation = activeAnimation else { return }
        
        animatedView.applyAnimation(animation)
        animatedView.animate()
        
        updateAnimationDetailsLabel()
        setNextAnimation()
    }
    
    private func updateAnimationDetailsLabel() {
        guard let animation = activeAnimation else { return }
        
        animationDetailsLabel.text = """
            preset: \(animation.preset.rawValue)
            curve: \(animation.curve.rawValue)
            delay: \(format(animation.delay))
            duration: \(format(animation.duration))
            force: \(format(animation.force))
            """
    }
    
    private func setNextAnimation() {
        nextAnimation = animationManager.getRandomAnimation()
        activeAnimation = nextAnimation
        runAnimationButton.setTitle(activeAnimation?.preset.rawValue, for: .normal)
    }
    
    private func format(_ value: Double) -> String {
        String(format: "%.2f", value)
    }
}


