//
//  LivePhotoCameraCell.swift
//  ExampleApp
//
//  Created by Peter Stajger on 25/09/2017.
//  Copyright © 2017 Inloop. All rights reserved.
//

import Foundation
import UIKit
import ImagePicker

class LivePhotoCameraCell : CameraCollectionViewCell {
    
    @IBOutlet weak var snapButton: UIButton!
    @IBOutlet weak var enableLivePhotosButton: StationaryButton!
    
    @IBAction func snapButtonTapped(_ sender: UIButton) {
        if enableLivePhotosButton.isSelected {
            takeLivePhoto()
        }
        else {
            takePicture()
        }
    }
    
    @IBAction func flipButtonTapped(_ sender: UIButton) {
        flipCamera(nil)
    }
    
}

open class StationaryButton : UIButton {
    
    open override var isSelected: Bool {
        get { return super.isSelected }
        set { setSelected(newValue, animated: false) }
    }
    
    open override var isHighlighted: Bool {
        didSet {
            if isHighlighted == false {
                setSelected(!isSelected, animated: true)
            }
        }
    }
    
    public func setSelected(_ selected: Bool, animated: Bool) {
        
        guard isSelected != selected else {
            return
        }
        
        super.isSelected = selected
        selectionDidChange(animated: animated)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        updateTint()
    }
    
    ///
    /// Override this method to track when button's state is selected or deselected.
    /// You dont need to call super, default implementation does nothing.
    ///
    open func selectionDidChange(animated: Bool) {
        updateTint()
    }
    
    private func updateTint() {
        if isSelected {
            tintColor = UIColor.yellow
        }
        else {
            tintColor = UIColor(white: 0.8, alpha: 0.4)
        }
    }
}