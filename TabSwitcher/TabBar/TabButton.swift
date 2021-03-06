//
//  TabButton.swift
//  TabSwitcher
//
//  Created by Ivo Silva on 25/09/2016.
//  Copyright © 2016 Ivo Silva. All rights reserved.
//

import UIKit
import Cartography

/**
 The tab button delegate to delegate the button tapped action
 */
protocol TabButtonDelegate: class {
    func buttonTapped(index: Int)
}

/**
 The tab button view
 */
class TabButton: UIView {
    
    private var state: TabState = .normal
    
    private let button: UIButton = UIButton(frame: CGRect.zero)
    
    private let tabIndex: Int
    
    var titleWidth: CGFloat? {
        let titleLabel = button.titleLabel
        titleLabel?.sizeToFit()
        return titleLabel?.frame.width
    }
    
    weak var delegate: TabButtonDelegate?
    
    init(frame: CGRect, index: Int) {
        tabIndex = index
        
        super.init(frame: CGRect.zero)
        
        addSubViews()
        
        addConstraints()
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Add the subviews to the view
     */
    private func addSubViews() {
        addSubview(button)
    }
    
    /**
     Add auto-layout constraints to the view
     */
    private func addConstraints() {
        constrain(self, button) { container, button in
            button.edges == container.edges
        }
    }

    
    /**
     Obj-C method called when button is tapped
     */
    @objc private func buttonTapped() {
        delegate?.buttonTapped(index: tabIndex)
    }
    
    /**
     Configure the button with the title and indicator's color
     
     - parameter title:String The title of the button
     */
    func configure(title: String, color: UIColor, font: UIFont?) {
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = font
        
    }
}
