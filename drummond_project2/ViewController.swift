// Kyle Drummond
// krd48@zips.uakron.edu
// IOS Project 2 SP 2018

import UIKit

struct DefaultInfo : Codable{
    var First_name: String?
    var Last_name: String?
    var favfood: String?
    var favrestaurant: String?
    var button: Bool?
}

class ViewController: UIViewController, UITextFieldDelegate {
    

    //  info of the (single) user
    var defaultInfo = DefaultInfo()
    var lastname = DefaultInfo()
    var favfood = DefaultInfo()
    var favrestaurant = DefaultInfo()
    var defaultswitch = DefaultInfo()
    
    
 
    
    @IBOutlet weak var first: UITextField!
    @IBOutlet weak var last: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var restaurant: UITextField!
    @IBOutlet weak var toggle: UISwitch!
    
    // URL for file proj2.plist in user document directory for this app
    lazy var localFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("proj2").appendingPathExtension("plist")
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.emailText.delegate = self
        self.first.delegate = self
        self.last.delegate = self
        self.restaurant.delegate = self
    
    
    defer {
    // set the default field
    self.first.text = self.defaultInfo.First_name
    self.last.text = self.defaultInfo.Last_name
    self.emailText.text = self.defaultInfo.favfood
    self.restaurant.text = self.defaultInfo.favrestaurant
    self.toggle.isOn = self.defaultInfo.button!
    
    }

    // grab path of plist file
    guard let defaultInfoURL = Bundle.main.url(forResource: "proj2", withExtension:"plist") else {
        print("Error: is it still here Unable to form path")
  
        
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
                let curswitch = self.toggle.isOn
                print("New favorite restaurant: \(favrestaurant)")
                
                self.defaultInfo.favrestaurant = favrestaurant
                self.defaultInfo.button = curswitch
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
