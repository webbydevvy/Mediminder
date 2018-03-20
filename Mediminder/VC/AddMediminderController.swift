//
//  AddMediminderController.swift
//  Mediminder
//
//  Created by Kaari Strack on 20/03/2018.
//  Copyright © 2018 HSJK. All rights reserved.
//

import UIKit

class AddMediminderController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(with:)),
            name: .UIKeyboardWillShow,
            object: nil
        )
    }
    
    // MARK: Actions
    
    @objc func keyboardWillShow(with notification: Notification) {
//        let key = "UIKeyboardFrameEndUserInfoKey"
        guard let keyboardFrame = notification.userInfo?[""] as? NSValue else { return }

        let keyboardHeight = keyboardFrame.cgRectValue.height

        bottomConstraint.constant = keyboardHeight

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }

    }

    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func done(_ sender: UIButton) {
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
