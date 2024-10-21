//
//  ViewController.swift
//  Homework 3.01
//
//  Created by Мария Гетманская on 21.10.2024.
//

import UIKit
import SpringAnimation

final class AnimationViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var animatedView: SpringView!
    @IBOutlet var animationDetailsLabel: UILabel!
    @IBOutlet var runAnimationButton: UIButton!
    
    // MARK: - Properties
    private var activeAnimation: RandomAnimation?
    private var nextAnimation: RandomAnimation?
    private let animationManager = AnimationManager()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }

    // MARK: - IBActions
    @IBAction func runAnimationButtonTapped(_ sender: SpringButton) {
        runNextAnimation()
    }
    
    // MARK: - Private Methods
    private func setupInitialState() {
        animatedView.layer.cornerRadius = 10
        activeAnimation = animationManager.getRandomAnimation()
        runAnimationButton.setTitle("Run", for: .normal)
        updateAnimationDetailsLabel()
    }
    
    private func runNextAnimation() {
        guard let animation = activeAnimation else { return }
        
        animatedView.applyAnimation(animation)
        animatedView.animate()
        
        updateAnimationDetailsLabel()
        setNextAnimation()
    }
    
    private func setNextAnimation() {
        nextAnimation = animationManager.getRandomAnimation()
        activeAnimation = nextAnimation
        
        if let preset = activeAnimation?.preset.rawValue {
            runAnimationButton.setTitle("Run \(preset)", for: .normal)
        }
    }
    
    private func updateAnimationDetailsLabel() {
        guard let animation = activeAnimation else { return }
        
        animationDetailsLabel.text = """
            preset: \(animation.preset.rawValue)
            curve: \(animation.curve.rawValue)
            force: \(format(animation.force))
            duration: \(format(animation.duration))
            delay: \(format(animation.delay))
            """
    }
    
    private func format(_ value: Double) -> String {
        String(format: "%.2f", value)
    }
}



