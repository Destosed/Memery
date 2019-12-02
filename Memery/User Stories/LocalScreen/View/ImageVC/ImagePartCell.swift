
import UIKit

class ImagePartCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    
    func setup(with image: Image) {
        
        guard let imageData = image.imageData else { return }
        myImageView.image = UIImage(data: imageData)
    }
}
