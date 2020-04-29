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
import Firebase
import WatchConnectivity

public var faveAnimeListViewModelObject = [AnimeTableModel]()
public class AnimeDetailedInfoView: UIViewController {
    var session: WCSession?
    var detailsScreenViewModel = DetailsViewModel()

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
    @IBAction func btnFavourite(_ sender: UIButton) {
        Analytics.logEvent("FavouriteAnimePressed", parameters: nil)
        var fave = AnimeTableModel()
        fave.airing = animeList.airing ?? true
        fave.start_date = animeList.start_date ?? ""
        fave.end_date = animeList.end_date ?? ""
        fave.mal_id = animeList.mal_id ?? 0
        fave.members = animeList.members ?? 0
        fave.rated = animeList.rated ?? ""
        fave.image_url = animeList.image_url ?? ""
        fave.url = animeList.url ?? ""
        fave.synopsis = animeList.synopsis ?? ""
        fave.end_date = animeList.end_date ?? ""
        fave.title = animeList.title ?? "Unknown"
        fave.episodes = animeList.episodes ?? 0
        fave.score = animeList.score ?? 0.0
        fave.type = animeList.type ?? ""
        faveAnimeListViewModelObject.append(fave)
        displayDefaultAlert(title: "Added to favourites!", message: "= )")
        detailsScreenViewModel.saveAnime(model: AnimeDetails(title: fave.title ?? "",
                                                             imageUrl: fave.image_url ?? "",
                                                             type: fave.type ?? ""))
    }
    var animeList = AnimeTableModel()
    override public func viewDidLoad() {
        super.viewDidLoad()
        detailsScreenViewModel.repo = CoreData()
        lblAnimeTitle.text = animeList.title
        if let imageUrl = animeList.image_url {
          imgAnimeImage.loadImageUsingUrlString(urlString: imageUrl)
        }
        txtViewAnimeSynopsis.text = animeList.synopsis
        lblAnimeScore.text = "\(animeList.score ?? 0.0)"
        lblAnimeEpisodes.text = "\(animeList.episodes ?? 0)"
        lblAnimeRated.text = animeList.rated
        lblAnimeStartDate.text = animeList.start_date
        lblAnimeEndDate.text = animeList.end_date
        lblAnimeURL.text = animeList.type
        if animeList.airing ?? false {
            lblAnimeAiring.text = "True"
        } else {
            lblAnimeAiring.text = "False"
        }
        self.configureWatchKitSesstion()
    }
    func configureWatchKitSesstion() {
      if WCSession.isSupported() {
        session = WCSession.default
        session?.delegate = self
        session?.activate()
      }
    }
    func displayDefaultAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension AnimeDetailedInfoView: WCSessionDelegate {
  public func sessionDidBecomeInactive(_ session: WCSession) {
  }
  public func sessionDidDeactivate(_ session: WCSession) {
  }
  public func session(_ session: WCSession,
                      activationDidCompleteWith activationState: WCSessionActivationState,
                      error: Error?) {
  }
  public func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
    print("received message: \(message)")
    DispatchQueue.main.async {
        if (message["watch"] as? String) != nil {
        if let validSession = self.session, validSession.isReachable {
            let data: [String: Any] = ["iPhone": self.lblAnimeTitle.text as Any,
                                       "iPhoneImage": self.animeList.image_url as Any]
          validSession.sendMessage(data, replyHandler: nil, errorHandler: nil)
        }
      }
    }
  }
}
