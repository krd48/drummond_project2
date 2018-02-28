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
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var last: UITextField!
    @IBOutlet weak var restaurant: UITextField!
    //@IBOutlet weak var f_name: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailText.delegate = self
        self.first.delegate = self
        self.last.delegate = self
        self.restaurant.delegate = self
    }
    // Make the keyboard disappear once return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        // Note: implements default return key behavior
        return true
    }
    

}


