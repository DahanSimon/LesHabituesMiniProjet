//
//  ViewController.swift
//  MiniProjet_Les_Habitués
//
//  Created by Simon Dahan on 10/03/2022.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDelegate {
    let viewModel = ViewModel()
    var shop: ShopDatas?
    var bestOffers: [Int: Double]?
    let shopTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        shopTableView.delegate = self
        shopTableView.dataSource = self
        shopTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        view.backgroundColor = .white
        view.addSubview(shopTableView)
        shopTableView.translatesAutoresizingMaskIntoConstraints = false
        shopTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        shopTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        shopTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        shopTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        shopTableView.rowHeight = 100
        viewModel.fecthShop()
        self.viewModel.shops.bind { shops in
            self.shop = shops
            if shops == nil {
                self.presentAlert()
            } else {
                self.shopTableView.reloadData()
            }
        }
        
        self.viewModel.bestOffers.bind { bestOffers in
            self.bestOffers = bestOffers
            self.shopTableView.reloadData()
        }
    }
    
    private func presentAlert() {
        let alertVC = UIAlertController(title: "Error", message: "Sorry, something went wrong. \nPlease try again later. ", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
}

extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let shops = self.shop {
            return shops.data.count
        } else {
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let shops = self.shop, let bestOffer = bestOffers?[shops.data[indexPath.row].id] else {
            return UITableViewCell()
        }
        // swiftlint:disable force_cast
        let cell = shopTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        // swiftlint:enable force_cast
        let shop = shops.data[indexPath.row]        
        cell.setupCell(imageUrl: shop.pictureURL, name: shop.chain, address: shop.localisations[0].address, zipcode: shop.localisations[0].zipcode + " " + shop.localisations[0].city, bestOffer: bestOffer)
        return cell
    }
}
