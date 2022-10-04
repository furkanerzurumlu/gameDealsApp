//
//  dealNetworking.swift
//  gameDeals
//
//  Created by Furkan Erzurumlu on 4.10.2022.
//

import Foundation
import Alamofire

class dealNetworking {
    static let upComingDeals = "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15"
    
    func getUpComingDeals(completion: @escaping (GameDeal?)->()){
        let request = AF.request("https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15")
        request.validate().responseDecodable(of: GameDeal.self) {[weak self] (response) in
            guard let deals = response.value else{
                completion(nil)
                print(response.error)
                return
            }
            completion(deals)
        }
        
    }
}

