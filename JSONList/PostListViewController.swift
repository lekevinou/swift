//
//  PostListViewController.swift
//  JSONList
//
//  Created by Utilisateur invité on 05/01/2018.
//  Copyright © 2018 Utilisateur invité. All rights reserved.
//

import UIKit

class PostListViewController : UITableViewController {
    
    var jsonArray  = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        URLSession.shared.dataTask(with: URL(string:url)!) { data, response, error in
            let jsonObject = try! JSONSerialization.jsonObject(with: data!, options: [])
            self.jsonArray = jsonObject as! [[String: Any]]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")!
        
        let postJSON = jsonArray[indexPath.row]
        
        cell.textLabel?.text = postJSON["title"] as? String
        
        return cell
    }
    
}
