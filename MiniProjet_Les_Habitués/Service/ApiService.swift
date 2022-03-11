//
//  ApiService.swift
//  MiniProjet_Les_Habitues
//
//  Created by Simon Dahan on 10/03/2022.
//

import Foundation
import Alamofire
class ApiService {
    private let url = "https://www.leshabitues.fr/testapi/shops"
    func getDatas(callback: @escaping (Result<ShopDatas, ApiError>) -> Void) {
        AF.request(url).response { response in
            DispatchQueue.main.async {
                guard let data =  response.data else {
                    callback(Result.failure(ApiError.failedRequest))
                    return
                }
                if let shopDatas = try? JSONDecoder().decode(ShopDatas.self, from: data) {
                    callback(Result.success(shopDatas))
                } else {
                    callback(Result.failure(ApiError.failedRequest))
                }
            }
        }
    }
}
