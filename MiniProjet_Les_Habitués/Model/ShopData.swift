//
//  ShopData.swift
//  MiniProjet_Les_Habitues
//
//  Created by Simon Dahan on 10/03/2022.
//

import Foundation

// MARK: - ShopData
struct ShopData: Codable {
    let id: Int
    let category: String
    let categoryID: Int
    let offers: [Offer]
    let localisations: [Localisation]
    let tags: [String]
    let ecommercePrepayment, totalOffers: Int
    let pictureURL: String

    enum CodingKeys: String, CodingKey {
        case id, category
        case categoryID = "category_id"
        case offers, localisations
        case tags = "_tags"
        case ecommercePrepayment = "ecommerce_prepayment"
        case totalOffers = "total_offers"
        case pictureURL = "picture_url"
    }
}

// MARK: - Localisation
struct Localisation: Codable {
    let id: Int
    let name, address, zipcode: String
    let geoloc: Geoloc
    let city: String
}

// MARK: - Geoloc
struct Geoloc: Codable {
    let lat, lng: Double
}

// MARK: - Offer
struct Offer: Codable {
    let id, amount, reduction: String
}

typealias ShopDatas = [ShopData]
