
import UIKit

class ImagePartCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    
    func setup(with image: Image) {
        
        myImageView.image = image.image
    }
}
