//
//  FavoritesScreenViewController.swift
//  Movs
//
//  Created by Jéssica Trindade on 31/08/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import UIKit

class FavoritesScreenViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tabBarController?.title = "Movies"
        }


}
