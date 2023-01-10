//
//  ViewController.swift
//  QuotesApp
//
//  Created by Samed Eryiğit on 10.01.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text = "Kanye"
    }
    
    @IBAction func quoteButton(_ sender: Any) {
        AF.request("http://api.kanye.rest", method: .get).response { [self] response in
            if let data = response.data {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String:String]
                    quoteLabel.text = jsonResponse!["quote"]
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
