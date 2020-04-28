//
//  AnimeList+CoreDataProperties.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/28.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//
//

import Foundation
import CoreData

extension AnimeList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnimeList> {
        return NSFetchRequest<AnimeList>(entityName: "AnimeList")
    }
    //swiftlint:disable all
    @NSManaged public var type: String?
    @NSManaged public var image_url: String?
    @NSManaged public var title: String?

}
