import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(for image: Image) {
        
        imageView.image = image.image
    }
}
