//
//  HomePageVM.swift
//  gameDeals
//
//  Created by Furkan Erzurumlu on 4.10.2022.
//

import Foundation

protocol HomePageVMProtocol: AnyObject{
   
}

protocol HomePageVMDelegate: HomePageVMProtocol{
    var delegate: HomePageVMDelegateOutputs? {get set}
    var data: GameDeal? {get set}
    func getUpcomingData()
}

protocol HomePageVMDelegateOutputs: AnyObject{
    func reloadCollectionView()
}


class HomePageVM: HomePageVMDelegate{
    
    var data: GameDeal?
    var delegate: HomePageVMDelegateOutputs?
    var network: dealNetworking = dealNetworking()
    
    func getUpcomingData(){
        network.getUpComingDeals{ [weak self] (response) in
            if let response = response {
                self?.data = response
                self?.delegate?.reloadCollectionView()
            }
            
            
        }
        
    }
}




