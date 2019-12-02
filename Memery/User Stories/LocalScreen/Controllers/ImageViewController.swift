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
}

extension ImageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
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
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: tagsPartCellIdentifier) as! TagsPartCell
            cell.setup(for: image)
            return cell
        }
    }
}

extension ImageViewController {
    
    
}
