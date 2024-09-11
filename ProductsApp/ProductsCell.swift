import UIKit

protocol CellProtocol{
    func AddToCartClicked(indexPath:IndexPath)
}

class ProductsCell: UITableViewCell {

    @IBOutlet weak var cellBg: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var cellProtocol: CellProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addToCartButton(_ sender: Any) {
        
        cellProtocol?.AddToCartClicked(indexPath: indexPath!)
    }
    
}
