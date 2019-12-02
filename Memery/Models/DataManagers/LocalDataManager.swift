import Foundation
import UIKit
import CoreData

class LocalDataManager {
    
    static let shared = LocalDataManager()
    
    //MARK: - Album
    
    func getAllAlbums() -> [Album] {
        
        let fetchRequest = NSFetchRequest<Album>(entityName: "Album")
        guard let albums = try? context.fetch(fetchRequest) else { return [] }
        return albums
    }
    
    func getAlbum(by UUID: UUID) -> Album {
        
        let fetchRequest = NSFetchRequest<Album>(entityName: "Album")
        let predicate = NSPredicate(format: "id = '\(UUID)'", argumentArray: nil)
        fetchRequest.predicate = predicate
        guard let albums = try? context.fetch(fetchRequest).first else { fatalError("Couldn't func album by id") }
        return albums
    }
    
    func addAlbum(name: String) -> Album {
        
        let album = Album(context: self.context)
        album.name = name
        album.imageData = UIImage(named: "album_default")?.pngData()
        self.saveContext()
        
        return album
    }
    
    func addAlbum(name: String, image: UIImage) -> Album {
        
        let album = Album(context: self.context)
        album.name = name
        album.imageData = image.pngData()
        self.saveContext()
        
        return album
    }
    
    func deleteAlbum(album: Album) {
        context.delete(album)
        try? context.save()
    }
    
    //MARK: - Image
    
    func getAllImages() -> [Image] {
        return []
    }
    
    func addImage(to album: Album, image: UIImage) -> Image {
        
        let imageToAdd = Image(context: context)
        imageToAdd.imageData = image.pngData()
        album.addToImage(imageToAdd)
        saveContext()
        
        return imageToAdd
    }
    
    //MARK: - Tag
    
    func getAllTags() -> [Tag] {
        return []
    }
    
    func addTag(to image: Image, tag: String) {
        
        let tagToAdd = Tag(context: context)
        tagToAdd.text = tag
        image.addToTag(tagToAdd)
        saveContext()
    }
    
    //MARK: - Core Data stack
    
    lazy var context = self.persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Memery")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
