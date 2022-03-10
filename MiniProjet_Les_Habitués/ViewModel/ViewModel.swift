//
//  ViewModel.swift
//  MiniProjet_Les_Habitues
//
//  Created by Simon Dahan on 10/03/2022.
//

import Foundation

class ViewModel {
    let shops: Box<ShopDatas?> = Box(nil)
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
}
