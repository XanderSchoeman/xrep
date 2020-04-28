//
//  MangaList+CoreDataProperties.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/28.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//
//

import Foundation
import CoreData

extension MangaList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MangaList> {
        return NSFetchRequest<MangaList>(entityName: "MangaList")
    }
    //swiftlint:disable all
    @NSManaged public var title: String?
    @NSManaged public var image_url: String?
    @NSManaged public var type: String?

}
