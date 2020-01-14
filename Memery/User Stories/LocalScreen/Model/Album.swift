import Foundation
import UIKit

class AlbumDTO {
    
    let id = UUID().uuidString
    let name: String
    let image: UIImage?
    
    init(name: String) {
        self.name = name
        self.image = UIImage(named: "album_default")
    }
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
