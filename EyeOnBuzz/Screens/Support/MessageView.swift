//
//  MessageView.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 2/2/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class MessageView: UIView {
    
    var title: String = ""
    var notificationAction: Notification.Name?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ title: String, notificationAction: Notification.Name?) {
        self.title = title
        self.notificationAction = notificationAction
        
        setupAppearence(frame)
    }
    
    func setupAppearence(_ frame: CGRect) {
        addLabel(frame)
        
        if notificationAction != nil {
            addButton()
        }
    }
    
    func addLabel(_ frame: CGRect) {
        let label = UILabel(frame: frame)
        
        label.numberOfLines = 4
        label.center = self.center
        label.textAlignment = .center
        label.text = self.title
        label.backgroundColor = UIColor.clear
        
        self.addSubview(label)
    }
    
    func addButton() {
        // TODO: Replace positioning to Auto Layout constraints
        let button = UIButton(frame: CGRect(x: self.center.x - 100, y: self.center.y + 40, width: 200, height: 40))
        
        button.setTitle("Try again", for: .normal)
        button.setTitleColor(Colors.byProperty("commonButton"), for: .normal)
        
        button.backgroundColor = Colors.byProperty("commonButtonBackground")
        
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        
        self.addSubview(button)
    }
    
    @objc func buttonTapped(sender : UIButton) {
        LoadingIndicator.start()
        
        let delayTime = 1.0
        let newDelay = DispatchTime.now() + delayTime
        
        DispatchQueue.main.asyncAfter(deadline: newDelay, execute: {
            NotificationCenter.default.post(name: self.notificationAction!, object: nil)
            
            LoadingIndicator.stop()
        })
    }
    
}
