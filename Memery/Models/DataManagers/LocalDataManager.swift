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
    
    func isAlbumAllreadyExist(name: String) -> Bool {
        
        let fetchRequest = NSFetchRequest<Album>(entityName: "Album")
        let predicate = NSPredicate(format: "name = '\(name)'", argumentArray: nil)
        fetchRequest.predicate = predicate
        guard let albums = try? context.fetch(fetchRequest) else { fatalError() }
        
        if albums.isEmpty { return false } else { return true }
    }
    
//    func getAlbum(by UUID: UUID) -> Album {
//
//        let fetchRequest = NSFetchRequest<Album>(entityName: "Album")
//        let predicate = NSPredicate(format: "id = '\(UUID)'", argumentArray: nil)
//        fetchRequest.predicate = predicate
//        guard let albums = try? context.fetch(fetchRequest).first else { fatalError("Couldn't func album by id") }
//        return albums
//    }
    
    func addAlbum(name: String) -> Album {
        
        let album = Album(context: self.context)
        album.id = UUID().uuidString
        album.name = name
        album.coverImage = UIImage(named: "album_default")
        
        self.saveContext()
        
        return album
    }
    
    func addAlbum(name: String, image: UIImage) -> Album {
        
        let album = Album(context: self.context)
        album.id = UUID().uuidString
        album.name = name
        album.coverImage = image
        self.saveContext()
        
        return album
    }
    
    func deleteAlbum(album: Album) {
        context.delete(album)
        saveContext()
    }
    
    //MARK: - Image
    
    func getAllImages() -> [Image] {
        
        let fetchRequest = NSFetchRequest<Image>(entityName: "Image")
        guard let images = try? context.fetch(fetchRequest) else { return [] }
        return images
    }
    
    func addImage(to album: Album, image: UIImage) -> Image {
        
        let imageToAdd = Image(context: context)
        imageToAdd.id = UUID().uuidString
        imageToAdd.image = image
        
        let albumImages = album.mutableSetValue(forKey: #keyPath(Album.image))
        albumImages.add(imageToAdd)
        
        saveContext()
        
        return imageToAdd
    }
    
    func isImageContainsTag(image: Image, tagTitle: String) -> Bool {
        
        guard let tags = image.tag?.allObjects as? [Tag] else { fatalError() }
        for tag in tags {
            if tag.text! == tagTitle { return true }
        }
        return false
    }
    
    func deleteImage(image: Image) {
        
        if let imageTags = image.tag {
            image.removeFromTag(imageTags)
        }
        context.delete(image)
        saveContext()
    }
    
    //MARK: - Tag
    
    func getAllTags() -> [Tag] {
        let fetchRequest = NSFetchRequest<Tag>(entityName: "Tag")
        guard let tags = try? context.fetch(fetchRequest) else { return [] }
        return tags
    }
    
    func addTag(to image: Image, tag: String) {
        
        let tagToAdd = Tag(context: context)
        tagToAdd.id = UUID().uuidString
        tagToAdd.text = tag
        
        let imageTags = image.mutableSetValue(forKey: #keyPath(Image.tag))
        imageTags.add(tagToAdd)

        saveContext()
    }
    
    func deleteTag(from image: Image, tagTitle: String) {
        
        let imageTags = image.tag?.allObjects as! [Tag]
        let tagToDelete = imageTags.first(where: { $0.text! == tagTitle } )
        
        let imageTagsSet = image.mutableSetValue(forKey: #keyPath(Image.tag))

        imageTagsSet.remove(tagToDelete!)
        
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
