//
//  ViewModel.swift
//  MiniProjet_Les_Habitues
//
//  Created by Simon Dahan on 10/03/2022.
//

import Foundation

class ViewModel {
    let shops: Box<ShopDatas?> = Box(nil)
    let bestOffers: Box<[Int: Double]> = Box([:])
    private let api = ApiService()
    func fecthShop() {
        api.getDatas { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let datas):
                    self.shops.value = datas
                case .failure(_):
                    print("fail")
                }
            }
        }
    }
    
    func getBestOffers() {
        var bestOffers: [Int: Double] = [:]
        for shop in shops.value!.data {
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
        self.bestOffers.value = bestOffers
    }
}
