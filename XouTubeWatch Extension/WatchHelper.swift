//
//  WatchHelper.swift
//  XouTubeWatch Extension
//
//  Created by Xander Schoeman on 2020/04/28.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
extension WKInterfaceImage {
 public func image(fromUrl urlString: String) {
  guard let url = URL(string: urlString) else {
   print("Could not get Image with \(urlString)")
   self.setHidden(true)
   return
  }
  let theTask = URLSession.shared.dataTask(with: url) { data, response, _ in
   if let response = data {
    DispatchQueue.main.async {
     self.setImage(UIImage(data: response))
    }
   }
  }
  theTask.resume()
 }
}
