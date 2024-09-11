import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var productList = [Products]()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        let p1 = Products(id: 1, name: "Macbook Pro 14", img: "bilgisayar", price: 40000)
        let p2 = Products(id: 2, name: "Rayban", img: "gozluk", price: 4000)
        let p3 = Products(id: 3, name: "Sony ZX Series", img: "kulaklik", price: 11500)
        let p4 = Products(id: 4, name: "Gio Armani", img: "parfum", price: 13900)
        let p5 = Products(id: 5, name: "Casio X Series", img: "saat", price: 18000)
        let p6 = Products(id: 6, name: "Dyson V8", img: "supurge", price: 22000)
        let p7 = Products(id: 7, name: "iPhone 13 Pro", img: "telefon", price: 35000)
        
        productList.append(p1)
        productList.append(p2)
        productList.append(p3)
        productList.append(p4)
        productList.append(p5)
        productList.append(p6)
        productList.append(p7)
 
        tableView.separatorColor = .lightGray
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource, CellProtocol{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = productList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath) as! ProductsCell
        cell.imgView.image = UIImage(named: product.img!)
        cell.productNameLabel.text = product.name!
        cell.productPriceLabel.text = "\(product.price!) TL"
        
        cell.backgroundColor = .lightGray
        cell.cellBg.layer.cornerRadius = 12
        cell.selectionStyle = .none     // dont show the selection
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    // Delete Swipe
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let product = productList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            print("\(product.name!) deleted")
        }
        let editAction = UIContextualAction(style: .normal, title: "Edit") { contextualAction, view, bool in
            print("\(product.name!) edit is successful")
        }
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productList[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            if let product = sender as? Products{
                let destination = segue.destination as! DetailVC
                destination.product = product
            }
        }
    }
    
    func AddToCartClicked(indexPath: IndexPath) {
        let product = productList[indexPath.row]
        print("\(product.name!) added to cart")
    }
}

