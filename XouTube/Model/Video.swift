//
//  Video.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/02/20.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var channel: Channel?
}
class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
