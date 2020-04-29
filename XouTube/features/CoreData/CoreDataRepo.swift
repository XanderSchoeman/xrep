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
let appDelegate = UIApplication.shared.delegate as? AppDelegate
let managedContext = appDelegate!.persistentContainer.viewContext
public class CoreData: CoreDataProtocol {

    required public init() {
    }
    public func fetchAnime(
                  _ completion: @escaping (_ Models: [AnimeDetails]) -> Void) {
        var anime: [NSManagedObject] = []
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
        let entity = NSEntityDescription.entity(forEntityName: "AnimeList", in: managedContext)
        let anime = NSManagedObject(entity: entity!, insertInto: managedContext)
        anime.setValue(model.title, forKey: "title")
        anime.setValue(model.image_url, forKey: "image_url")
        anime.setValue(model.type, forKey: "type")
        do {
          try managedContext.save()
            print("Anime Saved")
        } catch {
        }
    }
    public func saveManga(model: MangaDetails) {
        let entity = NSEntityDescription.entity(forEntityName: "MangaList", in: managedContext)
        let manga = NSManagedObject(entity: entity!, insertInto: managedContext)
        manga.setValue(model.title, forKey: "title")
        manga.setValue(model.image_url, forKey: "image_url")
        manga.setValue(model.type, forKey: "type")
        do {
            try managedContext.save()
        } catch {
        }
    }
    public func deleteAnime(title: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AnimeList")
        let predicate = NSPredicate(format: "title == %@", title)
          fetchRequest.predicate = predicate
          do {
            let anime = try managedContext.fetch(fetchRequest)
            let objectToDelete = anime[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            do {
                try managedContext.save()
            } catch {
              return
            }
          } catch {
            return
          }
        
      }
    public func deleteManga(title: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MangaList")
        let predicate = NSPredicate(format: "title == %@", title)
          fetchRequest.predicate = predicate
          do {
            let manga = try managedContext.fetch(fetchRequest)
            let objectToDelete = manga[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            do {
                try managedContext.save()
            } catch {
              return
            }
          } catch {
            return
          }
        
      }
}


