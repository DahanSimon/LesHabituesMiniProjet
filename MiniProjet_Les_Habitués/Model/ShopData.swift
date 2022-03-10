//
//  ShopData.swift
//  MiniProjet_Les_Habitues
//
//  Created by Simon Dahan on 10/03/2022.
//

import Foundation
enum ApiError: Error {
  case invalidResponse
  case noData
  case failedRequest
  case invalidData
}

// MARK: - ShopDatas
struct ShopDatas: Codable {
    let object: String
    let total: Int
    let hasMore: Bool
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case object, total
        case hasMore = "has_more"
        case data
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let chain,category: String
    let offers: [Offer]
    let localisations: [Localisation]
    let totalOffers: Int
    let pictureURL: String
    let objectID: String

    enum CodingKeys: String, CodingKey {
        case id, chain, category
        case offers, localisations
        case totalOffers = "total_offers"
        case pictureURL = "picture_url"
        case objectID
    }
}

// MARK: - Localisation
struct Localisation: Codable {
    let id: Int
    let name, address, zipcode: String
    let city: String
}

// MARK: - Offer
struct Offer: Codable {
    let id, amount, reduction: String
}
