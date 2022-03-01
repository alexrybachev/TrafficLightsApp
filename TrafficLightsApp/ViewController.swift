//
//  ViewController.swift
//  TrafficLightsApp
//
//  Created by Aleksandr Rybachev on 01.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Views Properties
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    // MARK: - Button Properties
    @IBOutlet var lightButton: UIButton!
    
    // MARK: - Lights Properties
    var isRedLightOn = true
    var isYellowLightOn = false
    var isGreenLightOn = false
    var lightColor = LightColor.red
    
    // MARK: - Initial
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLightViews(for: [redLightView, yellowLightView, greenLightView])
        lightButton.configuration = setupButton(with: "START")
        
    }
    
    // MARK: - IBActions
    @IBAction func changeTraficLight() {
        
        lightButton.configuration = setupButton(with: "NEXT")
        
        redLightView.backgroundColor = .red.withAlphaComponent(isRedLightOn ? 1 : 0.3)
        yellowLightView.backgroundColor = .yellow.withAlphaComponent(isYellowLightOn ? 1 : 0.3)
        greenLightView.backgroundColor = .green.withAlphaComponent(isGreenLightOn ? 1 : 0.3)

        switch lightColor {
        case .red:
            isRedLightOn = false
            isYellowLightOn = true
            lightColor = .yellow
        case .yellow:
            isYellowLightOn = false
            isGreenLightOn = true
            lightColor = .green
        case .green:
            isGreenLightOn = false
            isRedLightOn = true
            lightColor = .red
        }
    }
    
    // MARK: - Settings
    private func setupLightViews(for views: [UIView]) {
        redLightView.backgroundColor = .red.withAlphaComponent(0.3)
        yellowLightView.backgroundColor = .yellow.withAlphaComponent(0.3)
        greenLightView.backgroundColor = .green.withAlphaComponent(0.3)
        
        for view in views {
            view.layer.cornerRadius = view.frame.width / 2
        }
    }
    
    private func setupButton(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = .systemBlue
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.title = title
        buttonConfiguration.attributedTitle?.foregroundColor = .white
        buttonConfiguration.attributedTitle?.font = .boldSystemFont(ofSize: 32)
        
        return buttonConfiguration
    }
}

// MARK: - Extension
extension ViewController {
    enum LightColor {
        case red
        case yellow
        case green
    }
}

