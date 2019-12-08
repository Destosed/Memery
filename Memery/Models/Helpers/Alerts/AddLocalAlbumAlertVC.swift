import UIKit

class AddLocalAlbumAlertVC: UIViewController {
    
    //MARK: - Properties
    
    var imagePickerController = UIImagePickerController()
    weak var ownerVC: LocalViewController!
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    //MARK: - IBActions
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        //Check if album name allready exist
        //Check some textField validation
        //Successfully add this crap
        
        if let albumName = textField.text, !albumName.isEmpty {
            
            guard !LocalDataManager.shared.isAlbumAllreadyExist(name: albumName) else {
                AlertService.showInfoAlert(on: self, title: "Error", message: "The album with same name allready exist")
                return
            }
            LocalDataManager.shared.addAlbum(name: albumName, image: coverImageView.image!)
            dismiss(animated: true) {
                self.ownerVC.fetchData()
            }
        } else {
            return
        }
    }
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupImagePicker()
        textField.delegate = self
    }
    
    //MARK: - Setups
    
    func setupUI() {
        
        alertView.layer.cornerRadius = alertView.frame.height / 20
        
        cancelButton.layer.cornerRadius = cancelButton.frame.height / 5
        addButton.layer.cornerRadius = addButton.frame.height / 5
        
        coverImageView.layer.cornerRadius = coverImageView.frame.height / 8
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(coverImageViewWasTapped))
        coverImageView.addGestureRecognizer(tapGestureRecognizer)
        
        alertView.clipsToBounds = true
    }
    
    @objc func coverImageViewWasTapped() {
        present(imagePickerController, animated: true, completion: nil)
    }
}

//MARK: - Image Picker

extension AddLocalAlbumAlertVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func setupImagePicker() {
        
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            coverImageView.image = image
        }
        else {
            fatalError()
        }
        imagePickerController.dismiss(animated: true, completion: nil)
    }
}

extension AddLocalAlbumAlertVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
