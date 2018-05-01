//
//  ViewController.swift
//  klickAtTaskDemo
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 Sierra 4. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import MBProgressHUD


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var HomePageTableView: UITableView!
    
    var instructors : Instructor?
    var revenue : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HomePageTableView.delegate = self
        self.HomePageTableView.dataSource = self
        self.fetchData()
    }
    //MARK:- Hit API
func fetchData() {
    
    let urlstr = "auth/login"
    let param:[String:Any] = ["email":"msahas+54@onata.com" , "password":"qwerty","current_role":"SEEKER","app_version":"1.0","device_token":"tarun","device_type":"IOS","time_zone":"330"]
    
        ApiHandler.fetchData(urlStr: urlstr, parameters: param) { (jsonData) in
        print(jsonData ?? AnyObject.self)
        
           
          
         self.revenue = Mapper<Instructor>().map(JSONObject: jsonData)?.object
         UserSingleton.shared.loggedInUser = self.revenue
            
            print("hie")
            
            
           /* if (UserSingleton.shared.loggedInUser == nil)  {
                UserDefaults.standard.set("http://dev.onata.com:3000/auth/login", forKey:"Auth")
            }
            else {
                UserDefaults.standard.set(nil, forKey:"Auth")
            }
    */
        
            print(self.revenue?.booking?.first?.booking_item_info?.gig_id)
        
        self.HomePageTableView.reloadData()
        }
      //  print(self.instructors?.status_code ?? "
    
    let loadingNotification = MBProgressHUD.showAdded(to:HomePageTableView, animated: true)
    loadingNotification.mode = MBProgressHUDMode.indeterminate
    loadingNotification.label.text = "Loading..."
        }
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = HomePageTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCellFirst
        cell.labelID.text = self.revenue?.booking?.first?.booking_item_info?.gig_id
        cell.labelServiceName.text = self.revenue?.booking?.first?.booking_item_info?.service_name
        cell.labelServiceId.text = self.revenue?.booking?.first?.booking_item_info?.service_id
    return cell
}
}
