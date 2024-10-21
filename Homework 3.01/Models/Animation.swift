//
//  Animation.swift
//  Homework 3.01
//
//  Created by Мария Гетманская on 21.10.2024.
//

import UIKit
import SpringAnimation

struct RandomAnimation {
    var preset: AnimationPreset
    var curve: AnimationCurve
    var force: CGFloat
    var duration: TimeInterval
    var delay: TimeInterval
}

final class AnimationManager {
    
    func getRandomAnimation() -> RandomAnimation {
        let randomPreset: AnimationPreset = .allCases.randomElement()!
        let randomCurve: AnimationCurve = .allCases.randomElement()!
        let randomForce: CGFloat = .random(in: 0...4)
        let randomDuration: TimeInterval = .random(in: 0...3)
        let randomDelay: TimeInterval = .random(in: 0...2)
        
        return RandomAnimation(
            preset: randomPreset,
            curve: randomCurve,
            force: randomForce,
            duration: randomDuration,
            delay: randomDelay
        )
    }
}

