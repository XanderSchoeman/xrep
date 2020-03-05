//
//  Anime.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/05.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import Foundation
import UIKit
import XouDevSpec

public class Anime: UIViewController {
    @IBAction func btnAnime(_ sender: UIButton) {
        performSegue(withIdentifier: "segAnimeTable", sender: self)
    }
    @IBOutlet weak var searchBarAnime: UISearchBar!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
}
