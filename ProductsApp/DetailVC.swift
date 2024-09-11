import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var product: Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p =  product{
            self.navigationItem.title = p.name
            imageView.image = UIImage(named: p.img!)
            priceLabel.text = "\(p.price!) TL"
        }
        
        
    }
    
    @IBAction func AddToCartButton(_ sender: Any) {
        if let p =  product{
            print("\(p.name!) is added")
        }
        
        
    }
}
