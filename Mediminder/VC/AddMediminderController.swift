//
//  AddMediminderController.swift
//  Mediminder
//
//  Created by Kaari Strack on 20/03/2018.
//  Copyright © 2018 HSJK. All rights reserved.
//

import UIKit

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class AddMediminderController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        textView.delegate = self as? UITextViewDelegate
        
        super.viewDidLoad()
    // Do any additional setup after loading the view.
    }
    
    // keyboard disappears when user touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Returns
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func done(_ sender: UIButton) {

    }
}
