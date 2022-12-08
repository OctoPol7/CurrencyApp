//
//  ViewController.swift
//  Currency App
//
//  Created by laptop on 2022-11-28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cadLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var chfLabel: UILabel!
    
    @IBOutlet weak var gbpLabel: UILabel!
    
    @IBOutlet weak var jpyLabel: UILabel!
    
    @IBOutlet weak var tryLabel: UILabel!
    
    @IBOutlet weak var thbLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=2095ea30c55e5838036189dcafcb9eed")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                if data != nil {
                    do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        DispatchQueue.main.async {
//                            print(jsonResponse)
                            if let rates = (jsonResponse as AnyObject)["rates"] as? [String : Any] {
                                //print(rates)

                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(jpy)"
                                }
                                if let tryx = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(tryx)"
                                }
                                if let thb = rates["THB"] as? Double {
                                    self.thbLabel.text = "THB: \(thb)"
                                }

                            }
                        }

                    } catch {
                        print("error")
                    }
                }
            }
        }
        task.resume()
    }
    
}

