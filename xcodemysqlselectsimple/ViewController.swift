//
//  ViewController.swift
//  xcodemysqlselectsimple
//
//  Created by Luis José Sánchez Carrasco on 6/1/18.
//  Copyright © 2018 Luis José Sánchez Carrasco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pulsarButton(_ sender: Any) {
        self.lee()
    }
    func lee() {
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://iesayala.ddns.net/xcode/select.php")! as URL)
        request.httpMethod = "POST"
        
        
        let postString = ""
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
          //  print("response = \(response)")
            
        //    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
         //   print("responseString = \(responseString)")
            self.parseJSON(data!)
        }
        task.resume()
        
        
        
    }
    
    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = LocationModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let cod = jsonElement["cod"] as? String,
                let cosa = jsonElement["cosa"] as? String            {
                
                location.cod = cod
                location.cosa = cosa
                
            }
            
            locations.add(location)
            
      
        
            }
        
        // en locations tenemos el resulado de la select
        print(locations)
    }
    
}

