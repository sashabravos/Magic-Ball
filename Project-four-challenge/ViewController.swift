//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allBallsNames = ["ball1","ball2","ball3", "ball4","ball5"]
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView.init(image: UIImage(named: "backgroundColor")!)
        backgroundImage.contentMode = .scaleToFill
        return backgroundImage
    }()
    
    private lazy var mainLabel: UILabel = {
        var label = UILabel()
        label.text = "Show me the"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Marizta Script", size: 70)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var magicBall: UIImageView = {
        let magicBall = UIImageView.init(image: UIImage.init(named: "start_ball")!)
        return magicBall
    }()
    
    private lazy var buttonResult: UIButton = {
        let button = UIButton()
        button.setTitle("answer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "Marizta Script", size: 100)
        button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
// MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layoutSubviews()
    }
    
    private func layoutSubviews() {
        view.addSubview(self.backgroundImage)
        view.addSubview(self.magicBall)
        view.addSubview(self.mainLabel)
        view.addSubview(self.buttonResult)
        
// MARK: - Constraints
        
    magicBall.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
            magicBall.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            magicBall.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    
    backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor)
    ])
    
    buttonResult.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        buttonResult.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
        buttonResult.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: 160)
    ])
        
    mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor, constant: -170),
            mainLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor)
        ])
        
}

// MARK: - Functions
    
    @objc func buttonAction(sender: UIButton!) {
        self.magicBall.image = getRandomAnswer()
    }
    
    private func getRandomAnswer() -> UIImage? {
        UIImage(named: self.allBallsNames.randomElement() ?? "")
    }
}


