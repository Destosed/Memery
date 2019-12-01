import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(for image: Image) {
        
        guard let imageData = image.imageData else {
            print("Error: Couldn't convert data to image")
            return
        }
        imageView.image = UIImage(data: imageData)
    }
}
