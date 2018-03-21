//
//  AddMediminderController.swift
//  Mediminder
//
//  Created by Kaari Strack on 20/03/2018.
//  Copyright © 2018 HSJK. All rights reserved.
//

import UIKit
import CoreData

    // MARK: Border Controls

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

    // MARK: Outlets

class AddMediminderController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    var managedContext: NSManagedObjectContext!
    

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        textView.delegate = self
        
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        textView.becomeFirstResponder()
    }
    
    // keyboard disappears when user touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Returns
    
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
        textView.resignFirstResponder()
    }
    @IBAction func done(_ sender: UIButton) {
        guard let title = textView.text, !title.isEmpty else {
            return
        }
        
        let medication = Medication(context: managedContext)
        medication.title = title
        medication.priority = Int16(segmentedControl.selectedSegmentIndex)
        medication.date = Date()
        
        do {
            try managedContext.save()
            dismiss(animated: true)
            textView.resignFirstResponder()
        } catch {
            print("Error saving medication: \(error)")
        }
    }
}

extension AddMediminderController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        if doneButton.isHidden {
            textView.text.removeAll()
            textView.textColor = .black
            
            doneButton.isHidden = false
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
