//
//  PostDetailViewController.swift
//  JSONList
//
//  Created by Utilisateur invité on 19/01/2018.
//  Copyright © 2018 Utilisateur invité. All rights reserved.
//

import UIKit

class PostDetailViewController : UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    var postJSON : [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = postJSON["title"] as? String
    }
}
