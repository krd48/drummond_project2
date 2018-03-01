// Kyle Drummond
// IOS Project 2 SP 2018
// Moving keyboard for item
//
// Note: Comments with this label are to explain semantics of iOS
//       Do not use comments like these in your projects
// Used the class github account as a reference
import UIKit

struct DefaultInfo : Codable{
    var First_name: String?
    var Last_name: String?
    var favfood: String?
    var favrestaurant: String?
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
            output.text = "I am hungry"
        }
        else{
            output.text = "No I am not hungry"
        }
    }
    
    // mood of the (single) user
    var defaultInfo = DefaultInfo()
    var lastname = DefaultInfo()
    var favfood = DefaultInfo()
    var favrestaurant = DefaultInfo()
    
    
    // email address entry
    // Note: Must create text field in storyboard, and connect to this IBOutlet
    
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var last: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var restaurant: UITextField!
    
    //@IBOutlet weak var f_name: UITextField!
    
 
// URL for file UserData.plist in user document directory for this app
    lazy var localFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Default_Info").appendingPathExtension("plist")
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.emailText.delegate = self
        self.first.delegate = self
        self.last.delegate = self
        self.restaurant.delegate = self
    
    
    self.emailText.delegate = self

    
    defer {
    // set the default field
    self.emailText.text = self.defaultInfo.First_name
    }

    guard let defaultInfoURL = Bundle.main.url(forResource: "project2", withExtension:"plist") else {
    print("Error: Unable to form path")
    return
    }
    
    guard let data = try? Data(contentsOf:defaultInfoURL) else {
        print("Error: Invalid Data")
        return
    }
    
    // convert the class data plist to a classRecord
    guard let defaultInfo = try? PropertyListDecoder().decode(DefaultInfo.self, from: data) else {
        print("Error: Bad data format for property list")
        return
    }
    
    self.defaultInfo = defaultInfo
    
    /* Read user data from a plist file in an user's document directory */
    
    // data in resource file
    guard let localData = try? Data(contentsOf: defaultInfoURL) else {
        print("Error: Invalid Data")
        return
    }
    
    // convert the class data plist to a [String:String] dictionary
    guard let localDefaultInfoData = try? PropertyListDecoder().decode(DefaultInfo.self, from: localData) else {
        print("Error: Bad data format for property list")
        return
    }
    
    self.defaultInfo = localDefaultInfoData
}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
     textField.resignFirstResponder()
        
        self.emailText.resignFirstResponder()
        
        DispatchQueue.main.async {
            if let First_name = self.first.text {
                print("New first name: \(First_name)")
                
                self.defaultInfo.First_name = First_name
                
                // save the userData to the userDataURL
                let encoder = PropertyListEncoder()
                encoder.outputFormat = .xml
                do {
                    try encoder.encode(self.defaultInfo).write(to: self.localFileURL)
                } catch {
                    print(error)
                }
                
                print("\(#file), \(#function), \(#line) \(self.defaultInfo)")
                
                print("User data file: \(self.localFileURL)")
            }
        }
        
        DispatchQueue.main.async {
            if let Last_name = self.last.text {
                print("New last name: \(Last_name)")
                
                self.defaultInfo.Last_name = Last_name
                
                // save the userData to the userDataURL
                let encoder = PropertyListEncoder()
                encoder.outputFormat = .xml
                do {
                    try encoder.encode(self.defaultInfo).write(to: self.localFileURL)
                } catch {
                    print(error)
                }
                
                print("\(#file), \(#function), \(#line) \(self.defaultInfo)")
                
                print("User data file: \(self.localFileURL)")
            }
        }
        
        DispatchQueue.main.async {
            if let favfood = self.emailText.text {
                print("New favorite food: \(favfood)")
                
                self.defaultInfo.favfood = favfood
                
                // save the userData to the userDataURL
                let encoder = PropertyListEncoder()
                encoder.outputFormat = .xml
                do {
                    try encoder.encode(self.defaultInfo).write(to: self.localFileURL)
                } catch {
                    print(error)
                }
                
                print("\(#file), \(#function), \(#line) \(self.defaultInfo)")
                
                print("User data file: \(self.localFileURL)")
            }
        }
        
        
        DispatchQueue.main.async {
            if let favrestaurant = self.restaurant.text {
                print("New favorite restaurant: \(favrestaurant)")
                
                self.defaultInfo.favrestaurant = favrestaurant
                
                // save the userData to the userDataURL
                let encoder = PropertyListEncoder()
                encoder.outputFormat = .xml
                do {
                    try encoder.encode(self.defaultInfo).write(to: self.localFileURL)
                } catch {
                    print(error)
                }
                
                print("\(#file), \(#function), \(#line) \(self.defaultInfo)")
                
                print("User data file: \(self.localFileURL)")
            }
        }
        
        return true
    }
}


    
//
//    // Make the keyboard disappear once return is pressed
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//
//
//        // Note: implements default return key behavior
//        return true
//        }
//
//    }


