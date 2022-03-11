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
                    self.getBestOffers(shopsToBrowse: self.shops.value)
                case .failure(_):
                    print("fail")
                }
            }
        }
    }
    
    func getBestOffers(shopsToBrowse: ShopDatas?) {
        var bestOffers: [Int: Double] = [:]
        guard let shops = shopsToBrowse else {
            return
        }
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
        self.bestOffers.value = bestOffers
    }
}
