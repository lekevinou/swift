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
    @IBOutlet weak var imageView: UIImageView!
    
    var postJSON : [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = postJSON["title"] as? String

        loadImage()
    }
    
    func loadImage() {
        let imageURL = "http://placehold.it/1000"
        URLSession.shared.dataTask(with: URL(string: imageURL)!) { data, response, error in
            if let imageData = data {
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }.resume()
    }
}
