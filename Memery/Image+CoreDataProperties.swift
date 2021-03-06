//
//  Image+CoreDataProperties.swift
//  Memery
//
//  Created by Никита Лужбин on 08.12.2019.
//  Copyright © 2019 Никита. All rights reserved.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var id: String?
    @NSManaged public var image: UIImage?
    @NSManaged public var tag: NSSet?
    @NSManaged public var album: Album?

}

// MARK: Generated accessors for tag
extension Image {

    @objc(addTagObject:)
    @NSManaged public func addToTag(_ value: Tag)

    @objc(removeTagObject:)
    @NSManaged public func removeFromTag(_ value: Tag)

    @objc(addTag:)
    @NSManaged public func addToTag(_ values: NSSet)

    @objc(removeTag:)
    @NSManaged public func removeFromTag(_ values: NSSet)

}
