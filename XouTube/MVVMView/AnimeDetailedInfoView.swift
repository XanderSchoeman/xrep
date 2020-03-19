//
//  AnimeDetailedInfoView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/19.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import Foundation
import UIKit
import XouDevSpec

public class AnimeDetailedInfoView: UIViewController {
    @IBOutlet weak var lblAnimeTitle: UILabel!
    @IBOutlet weak var imgAnimeImage: UIImageView!
    @IBOutlet weak var txtViewAnimeSynopsis: UITextView!
    @IBOutlet weak var lblAnimeScore: UILabel!
    @IBOutlet weak var lblAnimeEpisodes: UILabel!
    @IBOutlet weak var lblAnimeRated: UILabel!
    @IBOutlet weak var lblAnimeStartDate: UILabel!
    @IBOutlet weak var lblAnimeEndDate: UILabel!
    @IBOutlet weak var lblAnimeAiring: UILabel!
    @IBOutlet weak var lblAnimeURL: UILabel!
    var animeList = AnimeDetails()
//    var animeTitle = ""
//    var animeImage = UIImage()
//    var animeSynopsis = ""
//    var animeScore = ""
//    var animeEpisodes = ""
//    var animeRated = ""
//    var animeStartDate = ""
//    var animeEndDate = ""
//    var animeAiring = true
//    var animeUrl = ""
    override public func viewDidLoad() {
        super.viewDidLoad()
        lblAnimeTitle.text = animeList.title
        //imgAnimeImage.image = UIImage(named: animeList.image_url ?? "")
        if let imageUrl = animeList.image_url {
          imgAnimeImage.loadImageUsingUrlString(urlString: imageUrl)
        }
        txtViewAnimeSynopsis.text = animeList.synopsis
        lblAnimeScore.text = "\(animeList.score ?? 0.0)"
        lblAnimeEpisodes.text = "\(animeList.episodes ?? 0)"
        lblAnimeRated.text = animeList.rated
        lblAnimeStartDate.text = animeList.start_date
        lblAnimeEndDate.text = animeList.end_date
        lblAnimeURL.text = animeList.url
        if animeList.airing! {
            lblAnimeAiring.text = "True"
        } else {
            lblAnimeAiring.text = "False"
        }
    }
}
