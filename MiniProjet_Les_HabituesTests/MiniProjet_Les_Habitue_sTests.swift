//
//  MiniProjet_Les_Habitue_sTests.swift
//  MiniProjet_Les_HabituésTests
//
//  Created by Simon Dahan on 10/03/2022.
//

import XCTest
@testable import MiniProjet_Les_Habitues

class LesHabituesTests: XCTestCase {
    var shops: ShopDatas?
    var bestOffers: [Int: Double] = [:]
    override func setUp() {
        guard let bundlePath = Bundle.main.path(forResource: "Data", ofType: "json"),
              let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8),
              let shops = try? JSONDecoder().decode(ShopDatas.self, from: jsonData) else {
                  self.shops = nil
                  return
              }
        
        self.shops = shops
        var bestOffers: [Int: Double] = [:]
        for shop in shops.data {
            var bestOffer: Double = 0
            for offer in shop.offers {
                if let reduction = Double(offer.reduction) {
                    if reduction > bestOffer {
                        bestOffer = reduction
                    }
                }
            }
            bestOffers[shop.id] = bestOffer
        }
        self.bestOffers = bestOffers
    }
    
    func testFetchShopDataUpdatesViewModel() {
        setUp()
        let expectation = self.expectation(
            description: "Get Shops List")
        let viewModel = ViewModel()
        viewModel.shops.bind { shops in
            if shops == self.shops {
                expectation.fulfill()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.fecthShop()
        }
        waitForExpectations(timeout: 8, handler: nil)
    }
    
    func testGetBestOfferUpdatesViewModel() {
        setUp()
        let expectation = self.expectation(
            description: "Get Best Offer")
        let viewModel = ViewModel()
        viewModel.bestOffers.bind { bestOffers in
            if bestOffers == self.bestOffers {
                expectation.fulfill()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.getBestOffers(shopsToBrowse: self.shops)
        }
        waitForExpectations(timeout: 8, handler: nil)
    }
    
}
