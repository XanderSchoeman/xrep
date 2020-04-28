//
//  CoreDataRepo.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/28.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import Foundation
import CoreData
import XouDevSpec
//swiftlint:disable all
public class CoreData {
    public init() {
    }
    public func fetchAnime(
                  _ completion: @escaping (_ Models: [AnimeDetails]) -> Void) {
        var anime: [NSManagedObject] = []
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AnimeList")
        do {
            anime = try managedContext.fetch(fetchRequest)
        } catch {
            print("Error")
        }
        var animeObj = [AnimeDetails]()
        for item in anime {
            let title: String = item.value(forKey: "title") as! String
            let imageUrl: String = item.value(forKey: "image_url") as! String
            let type: String = item.value(forKey: "type") as! String
            let temp = AnimeDetails(title: title, imageUrl: imageUrl, type: type)
            animeObj.append(temp)
        }
        completion(animeObj)
    }
    
    public func fetchManga(
                  _ completion: @escaping (_ Models: [MangaDetails]) -> Void) {
        var manga: [NSManagedObject] = []
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AnimeList")
        do {
            manga = try managedContext.fetch(fetchRequest)
        } catch {
            print("Error")
        }
        var mangaObj = [MangaDetails]()
        for item in manga {
            let title: String = item.value(forKey: "title") as! String
            let imageUrl: String = item.value(forKey: "image_url") as! String
            let type: String = item.value(forKey: "type") as! String
            let temp = MangaDetails(title: title, imageUrl: imageUrl, type: type)
            mangaObj.append(temp)
        }
        completion(mangaObj)
    }
    public func saveAnime(model: AnimeDetails) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AnimeList", in: managedContext)
        let anime = NSManagedObject(entity: entity!, insertInto: managedContext)
        anime.setValue(model.title, forKey: "title")
        anime.setValue(model.image_url, forKey: "image_url")
        anime.setValue(model.type, forKey: "type")
        do {
          try managedContext.save()
        } catch {
        }
    }
    public func saveManga(model: MangaDetails) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AnimeList", in: managedContext!)
        let manga = NSManagedObject(entity: entity!, insertInto: managedContext)
        manga.setValue(model.title, forKey: "title")
        manga.setValue(model.image_url, forKey: "image_url")
        manga.setValue(model.type, forKey: "type")
        do {
          try managedContext?.save()
        } catch {
        }
    }
}


