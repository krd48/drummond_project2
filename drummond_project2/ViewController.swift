//
// Moving keyboard for item
//
// Note: Comments with this label are to explain semantics of iOS
//       Do not use comments like these in your projects

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // email address entry
    // Note: Must create text field in storyboard, and connect to this IBOutlet
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var f_name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.f_name.text = "matt"
        
        self.emailText.delegate = self
        
        // shifts the view up for space for the keyboard
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) {
            notification in
            
            // find the size of the keyboard
            guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                print("ERROR: Unable to get keyboard size")
                return
            }
            
            // move the whole thing up
            self.view.frame.origin.y = -keyboardSize.height
        }
        
        // shifts the view up for space for the keyboard
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: nil) {
            notification in
            
            // move back to original position
            self.view.frame.origin.y = 0
        }
    }
    
    func loadDefaults() {
        // TODO: Load in plist values
    }
    
    @IBAction func updateDefaults() {
        // TODO: Grab the input field values and update the plist with them
        print("we just saved the user inputs.")
    }
    
    // Make the keyboard disappear once return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        // Note: implements default return key behavior
        return true
    }
}
