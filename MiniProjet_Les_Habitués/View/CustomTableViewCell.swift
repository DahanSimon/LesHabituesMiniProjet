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
        label.textColor = UIColor(red: 196/256, green: 196/256, blue: 196/256, alpha: 1.0)
        label.font = UIFont(name: "Lato-Bold", size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 196/256, green: 196/256, blue: 196/256, alpha: 1.0)
        label.font = UIFont(name: "Lato-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var zipcodeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 196/256, green: 196/256, blue: 196/256, alpha: 1.0)
        label.font = UIFont(name: "Lato-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bestOfferLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 74/256, green: 144.0/256, blue: 226.0/256, alpha: 1.0)
        label.font = UIFont(name: "Lato-Regular", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        [self.nameLabel,
         self.addressLabel,
         self.zipcodeLabel,
         self.bestOfferLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(chainLogo)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            chainLogo.topAnchor.constraint(equalTo: topAnchor),
            chainLogo.bottomAnchor.constraint(equalTo: bottomAnchor),
            chainLogo.leftAnchor.constraint(equalTo: leftAnchor),
            chainLogo.widthAnchor.constraint(equalTo: chainLogo.heightAnchor),
            
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.leftAnchor.constraint(equalTo: chainLogo.rightAnchor, constant: 5)
        ])
    }
    
    func setupCell(imageUrl: String, name: String, address: String, zipcode: String, bestOffer: Double) {
        chainLogo.kf.indicatorType = .activity
        chainLogo.kf.setImage(with: URL(string: imageUrl), placeholder: nil, options: nil)
        nameLabel.text = name.uppercased()
        addressLabel.text = address
        zipcodeLabel.text = zipcode
        bestOfferLabel.text = "Up to \(String(bestOffer))$ offered "
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
