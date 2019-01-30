//
//  ViewController.swift
//  Api-Coredata
//
//  Created by User6 on 30/01/19.
//  Copyright © 2019 Antony. All rights reserved.
//



import UIKit

class ViewController: UIViewController {
    
    var ToDictionaryArray : [[String: Any]] = []
    
    
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var dict : [String:Any] = ["name": "switch 1", "type": "Switch", "gatewayId":515, "serialKey": "98:07:2D:48:D3:56", "noOfGangs": 4]
        var equipments = [[String:String]]()
        equipments.append(["name": "light", "type": "Light", "port": "1" ])
        equipments.append(["name": "television", "type": "Television", "port": "3" ])
        dict["equipments"] = equipments
        
        print(dict)
        
        
        var stringDictionary: Dictionary = [String: String]()
        stringDictionary["display"] = "FBC"
        print(stringDictionary)
        ToDictionaryArray.append(stringDictionary)
        
        var coding: Dictionary = [String: Any]()
        coding["coding"] = ToDictionaryArray
        
        print(coding)
        
        print(stringDictionary["python"] ?? "No subscript found: 🙁")
        
        let dic = ["2": "B", "1": "A", "3": "C"]
        
        print(dic)
        
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            // here "decoded" is of type `Any`, decoded from JSON data
            
            // you can now cast it with the right type
            if let dictFromJSON = decoded as? [String:String] {
                
                print(dictFromJSON)
                // use dictFromJSON
            }
        } catch {
            print(error.localizedDescription)
        }
        
        
        /*
         exceptActorList.push(
         {
         role: {
         id: "AUCG"
         },
         reference: {
         display: consent.name + "/" + consent.number
         },
         period: consent.period
         }
         
         */
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        CoreDataModel.instanceShared.Save()
        
    }
    
    @IBAction func fetchAction(_ sender: Any) {
        
        CoreDataModel.instanceShared.Fetch()
        
    }
    @IBAction func deleteAction(_ sender: Any) {
        
        CoreDataModel.instanceShared.deleteContact(phone: textField.text!)
    }
    @IBAction func GetAction(_ sender: Any) {
        
        CoreDataModel.instanceShared.FetchaData(phone: textField.text!)
        
    }
    @IBAction func update(_ sender: Any) {
        
        CoreDataModel.instanceShared.updateData(phone: textField.text!)
    }
    
    func getMethod()  {
        
        let scriptUrl = "http://172.16.0.246/g2socialmedia/api/posts?method=get&postId=4&header=DATE&body=DATA&userId="
        let urlWithParams = scriptUrl + "1000"
        guard let url = URL(string: urlWithParams) else {return}
        let session = URLSession.shared
        let urlRequest = URLRequest(url: url)
        
        let task : URLSessionDataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
                    print(json)
                    guard let results = json["data"] as? [[String: Any]] else{return} // Array Value
                    print(results)
                    for dicValue in results
                    {
                        print(dicValue)
                    }
                }catch {
                    print(error)
                }
            }
        }
        task.resume()
        
        
    }
    
}


//if loggedIn
//{
//    if let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: REQUEST_HUDDLE_IDENTIFIER) as? RequestHuddleVC {
//
//        TOKEN = UserDefaults.standard.string(forKey: "Token") ?? ""
//        print(TOKEN)
//
//        let navigationController = UINavigationController(rootViewController: homeVC)
//        self.window?.rootViewController = navigationController
//
//    }
//    self.window?.makeKeyAndVisible()
//}


//guard let url = URL(string: "http://172.16.0.246/g2socialmedia/api/posts?method=put&userId=1&postId=4&header=DATE&body=DATA") else {return}
//
//let session = URLSession.shared
//session.dataTask(with: url) { (data, response, error) in
//
//    if let response = response {
//        print(response) // if status code = 200 - 299 -> success else check URL.
//    }
//
//    if let data = data {
//        print(data)// raw data without serializing
//
//        //serializing data to json format
//        do {
//            guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
//            print(json)
//
//
//            guard let data = json["data"] as? [String: Any],
//                let postID = data["PostId"] as? Int,
//                let userID = data["UserId"] as? Int else {return }
//            print(postID, userID)
//
//
//
//        }catch {
//            print(error)
//        }
//
//
//
//    }
//    }.resume()

