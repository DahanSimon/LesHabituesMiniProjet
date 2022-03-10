//
//  CustomTableViewCell.swift
//  MiniProjet_Les_Habitues
//
//  Created by Simon Dahan on 10/03/2022.
//

import UIKit
import Kingfisher
class CustomTableViewCell: UITableViewCell {
    lazy var chainLogo: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var zipcodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bestOfferLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(chainLogo)
        addSubview(nameLabel)
        addSubview(addressLabel)
        addSubview(zipcodeLabel)
        addSubview(bestOfferLabel)
        NSLayoutConstraint.activate([
            chainLogo.topAnchor.constraint(equalTo: topAnchor),
            chainLogo.bottomAnchor.constraint(equalTo: bottomAnchor),
            chainLogo.leftAnchor.constraint(equalTo: leftAnchor),
            chainLogo.widthAnchor.constraint(equalTo: chainLogo.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: addressLabel.topAnchor),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor),
            nameLabel.leftAnchor.constraint(equalTo: chainLogo.rightAnchor),
            
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            addressLabel.bottomAnchor.constraint(equalTo: zipcodeLabel.topAnchor),
            addressLabel.rightAnchor.constraint(equalTo: rightAnchor),
            addressLabel.leftAnchor.constraint(equalTo: chainLogo.rightAnchor),
            
            zipcodeLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor),
            zipcodeLabel.bottomAnchor.constraint(equalTo: bestOfferLabel.topAnchor),
            zipcodeLabel.rightAnchor.constraint(equalTo: rightAnchor),
            zipcodeLabel.leftAnchor.constraint(equalTo: chainLogo.rightAnchor),
            
            bestOfferLabel.topAnchor.constraint(equalTo: zipcodeLabel.bottomAnchor),
            bestOfferLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            bestOfferLabel.rightAnchor.constraint(equalTo: rightAnchor),
            bestOfferLabel.leftAnchor.constraint(equalTo: chainLogo.rightAnchor)
        ])
    }
    
    func setupCell(imageUrl: String, name: String, address: String, zipcode: String, bestOffer: Double) {
        chainLogo.kf.indicatorType = .activity
        chainLogo.kf.setImage(with: URL(string: imageUrl), placeholder: nil, options: nil)
        nameLabel.text = name
        addressLabel.text = address
        zipcodeLabel.text = zipcode
        bestOfferLabel.text = "Up to \(String(bestOffer))$ offered "
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
