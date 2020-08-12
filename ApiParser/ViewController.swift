//
//  ViewController.swift
//  ApiParser
//
//  Created by Binshad on 12/11/18.
//  Copyright © 2018 Binshad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        APIClient().get(with: "userlist.json", decode: { json -> Array<User>? in
            guard let user = json as? Array<User> else { return  nil }
            return user
        }, params: nil, completion: { [weak self] result in
                
                switch result {
                case .success(let user):
                    print(user)
                case .failure(let error):
                    print("the error \(error.localizedDescription)")
                }
        })
        // Test Changes
        
        
        
        //tesr changeesx 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        
    }
}

