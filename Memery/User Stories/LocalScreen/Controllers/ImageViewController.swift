import UIKit

private let imagePartCellIdentifier = "ImagePartCell"
private let tagsPartCellIdentifier = "TagsPartCell"

class ImageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var image: Image!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    @IBAction func showOptionsButtonPressed(_ sender: Any) {
        AlertService.showOptionsAlert(on: self, for: image)
    }
}

//MARK: - TableView Stack

extension ImageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.estimatedRowHeight = UITableView.automaticDimension
        
        let imagePartCellNib = UINib(nibName: "ImagePartCell", bundle: nil)
        tableView.register(imagePartCellNib, forCellReuseIdentifier: imagePartCellIdentifier)
        
        let tagsPartCellNib = UINib(nibName: "TagsPartCell", bundle: nil)
        tableView.register(tagsPartCellNib, forCellReuseIdentifier: tagsPartCellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: imagePartCellIdentifier) as! ImagePartCell
            cell.setup(with: image)
            cell.backgroundColor = .cyan
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: tagsPartCellIdentifier) as! TagsPartCell
            cell.setup(for: image)
            cell.owner = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            guard let imageData = image.imageData else { return 0 }
            guard let image = UIImage(data: imageData) else { return 0 }
            let decreaseCoefficient = image.size.width / 375
            return image.size.height / decreaseCoefficient
        } else {
            return UITableView.automaticDimension
        }
    }
}
