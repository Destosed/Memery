import Foundation
import UIKit

class AlertService {
    
    static func showInfoAlert(on vc: UIViewController, title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        vc.present(alertController, animated: true)
    }
    
    static func showOptionsAlert(on vc: AlbumViewController, for album: Album) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete Album", style: .destructive) { _ in
            LocalDataManager.shared.deleteAlbum(album: album)
            vc.navigationController?.popViewController(animated: true)
        }
        let addImageAction = UIAlertAction(title: "Add image", style: .default) { _ in
            vc.present(vc.imagePickerController, animated: true)
        }
        
        alertController.addAction(addImageAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        vc.present(alertController, animated: true)
    }
    
    static func showOptionsAlert(on vc: ImageViewController, for image: Image) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete Image", style: .destructive) { _ in
            LocalDataManager.shared.deleteImage(image: image)
            vc.navigationController?.popViewController(animated: true)
        }
        let shareAction = UIAlertAction(title: "Share", style: .default) { _ in
            //TODO: 
        }
        
        alertController.addAction(shareAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        vc.present(alertController, animated: true)
    }
}
