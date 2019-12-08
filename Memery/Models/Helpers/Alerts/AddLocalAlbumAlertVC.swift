import UIKit

class AddLocalAlbumAlertVC: UIViewController {
    
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
        //Creating and adding album
    }
    
    //MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
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
        
        //Image picker controller
        print("coverImageView was tapped")
    }
}
