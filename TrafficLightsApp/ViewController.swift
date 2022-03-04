//
//  ViewController.swift
//  TrafficLightsApp
//
//  Created by Aleksandr Rybachev on 01.03.2022.
//

import UIKit

enum LightColor {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {
    
    // MARK: - Views Properties
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    // MARK: - Button Properties
    @IBOutlet var lightButton: UIButton!
    
    // MARK: - Lights Properties
    
    private let lightOn: CGFloat = 1
    private let lightOff: CGFloat = 0.3
    
    private var currentLight = LightColor.green
    
    // MARK: - Initial
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.alpha = lightOff
        yellowLightView.alpha = lightOff
        greenLightView.alpha = lightOff
    }
    
    override func viewDidLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        
        lightButton.layer.cornerRadius = 10
    }
    
    // MARK: - IBActions
    @IBAction func changeTraficLight() {
        
        if lightButton.currentTitle == "START" {
            lightButton.setTitle("NEXT", for: .normal)
        }

        switch currentLight {
        case .red:
            redLightView.alpha = lightOff
            yellowLightView.alpha = lightOn
            currentLight = .yellow
        case .yellow:
            yellowLightView.alpha = lightOff
            greenLightView.alpha = lightOn
            currentLight = .green
        case .green:
            greenLightView.alpha = lightOff
            redLightView.alpha = lightOn
            currentLight = .red
        }
    }

}
