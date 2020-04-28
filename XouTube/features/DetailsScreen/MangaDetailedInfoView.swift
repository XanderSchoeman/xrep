//
//  MangaDetailedInfoView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/26.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import Foundation
import UIKit
import XouDevSpec
import Firebase
import WatchConnectivity

public var faveMangaListViewModelObject = [MangaTableModel]()
public class MangaDetailedInfoView: UIViewController {
    var session: WCSession?

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
        Analytics.logEvent("FavouriteMangaPressed", parameters: nil)
        var fave = MangaTableModel()
        fave.publishing = mangaList.publishing ?? true
        fave.start_date = mangaList.start_date ?? ""
        fave.end_date = mangaList.end_date ?? ""
        fave.mal_id = mangaList.mal_id ?? 0
        fave.members = mangaList.members ?? 0
        fave.chapters = mangaList.chapters ?? 0
        fave.image_url = mangaList.image_url ?? ""
        fave.url = mangaList.url ?? ""
        fave.synopsis = mangaList.synopsis ?? ""
        fave.end_date = mangaList.end_date ?? ""
        fave.title = mangaList.title ?? "Unknown"
        fave.volumes = mangaList.volumes ?? 0
        fave.score = mangaList.score ?? 0.0
        fave.type = mangaList.type ?? ""
        faveMangaListViewModelObject.append(fave)
        displayDefaultAlert(title: "Added to favourites!", message: " = )")
    }
    var mangaList = MangaTableModel()

    override public func viewDidLoad() {
        super.viewDidLoad()
        lblAnimeTitle.text = mangaList.title
        if let imageUrl = mangaList.image_url {
          imgAnimeImage.loadImageUsingUrlString(urlString: imageUrl)
        }
        txtViewAnimeSynopsis.text = mangaList.synopsis
        lblAnimeScore.text = "\(mangaList.score ?? 0.0)"
        lblAnimeEpisodes.text = "\(mangaList.chapters ?? 0)"
        lblAnimeRated.text = "\(mangaList.volumes ?? 0)"
        lblAnimeStartDate.text = mangaList.start_date
        lblAnimeEndDate.text = mangaList.end_date
        lblAnimeURL.text = mangaList.type
        if mangaList.publishing ?? false {
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
extension MangaDetailedInfoView: WCSessionDelegate {
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
                                       "iPhoneImage": self.mangaList.image_url as Any]
          validSession.sendMessage(data, replyHandler: nil, errorHandler: nil)
        }
      }
    }
  }
}
