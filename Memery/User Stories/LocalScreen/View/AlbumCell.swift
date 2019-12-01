import UIKit

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!

    func setup(for album: Album) {
    
        albumImageView.layer.cornerRadius = albumImageView.frame.height / 8
        
        albumNameLabel.text = album.name
        
        if let imageData = album.imageData {
            albumImageView.image = UIImage(data: imageData)
        } else {
            albumImageView.image = UIImage(named: "album_default")
        }
        
        layoutIfNeeded()
    }
}
