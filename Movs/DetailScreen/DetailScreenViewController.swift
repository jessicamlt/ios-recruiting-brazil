//
//  DetailScreenViewController.swift
//  Movs
//
//  Created by Jéssica Trindade on 31/08/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseYearLabel: UILabel!
    @IBOutlet var typeDescriptionLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Movie"
    }

    

}
