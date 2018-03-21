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
    var medication: Medication?
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        textView.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.becomeFirstResponder()
        
        if let medication = medication {
            textView.text = medication.title
            textView.text = medication.title // duplicated to keep placeholder
            segmentedControl.selectedSegmentIndex = Int(medication.priority)
        }
    }
    
    
    
    
    // keyboard disappears when user touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Returns
    
    
    fileprivate func dismissAndResign() {
        dismiss(animated: true)
        textView.resignFirstResponder()
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismissAndResign()
    }
    @IBAction func done(_ sender: UIButton) {
        guard let title = textView.text, !title.isEmpty else {
            return
        }
        
        // Checks to see if medication exists in list already
        
        if let medication = self.medication {
            medication.title = title
            medication.priority = Int16(segmentedControl.selectedSegmentIndex)
        } else {
            
            // Create a new medication item
            
            let medication = Medication(context: managedContext)
            medication.title = title
            medication.priority = Int16(segmentedControl.selectedSegmentIndex)
            medication.date = Date()
        }
        
        do {
            try managedContext.save()
            dismissAndResign()
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
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
