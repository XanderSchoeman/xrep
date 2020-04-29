//
//  InterfaceController.swift
//  XouTubeWatch Extension
//
//  Created by Xander Schoeman on 2020/04/28.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
  @IBOutlet weak var label: WKInterfaceLabel!
  @IBOutlet weak var imgFromData: WKInterfaceImage!
    let session = WCSession.default
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    session.delegate = self
    session.activate()
  }
  override func willActivate() {
    super.willActivate()
  }
  override func didDeactivate() {
    super.didDeactivate()
  }
    @IBAction func tapSendToiPhone() {
        let data: [String: Any] = ["watch": "data from watch" as Any]
        session.sendMessage(data, replyHandler: nil, errorHandler: nil)
    }
}

extension InterfaceController: WCSessionDelegate {
  func session(_ session: WCSession,
               activationDidCompleteWith activationState: WCSessionActivationState,
               error: Error?) {
  }
  func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
    print("received data: \(message)")
    if let value = message["iPhone"] as? String {
      self.label.setText(value)
    }
    if let value2 = message["iPhoneImage"] as? String {
        self.imgFromData.image(fromUrl: value2)
    }
  }
}
