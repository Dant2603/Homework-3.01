//
//  Extension + SpringView.swift
//  Homework 3.01
//
//  Created by Мария Гетманская on 21.10.2024.
//

import SpringAnimation

extension SpringView {
    func applyAnimation(_ currentAnimation: RandomAnimation) {
        animation = currentAnimation.preset.rawValue
        curve = currentAnimation.curve.rawValue
        force = currentAnimation.force
        duration = currentAnimation.duration
        delay = currentAnimation.delay
        
        animate()
    }
}

