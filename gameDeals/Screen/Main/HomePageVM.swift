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
    var data: [DealElement] {get set}
    func getUpcomingData()
}

protocol HomePageVMDelegateOutputs: AnyObject{
    func reloadCollectionView()
}


class HomePageVM: HomePageVMDelegate{
    
    var delegate: HomePageVMDelegateOutputs?
    var data: [DealElement] = []
    var network: dealNetworking = dealNetworking()
    
    func getUpcomingData(){
        network.getUpComingDeals{ [weak self] (response) in
            if let response = response {
                self?.data = response.data
                self?.delegate?.reloadCollectionView()
            }
            
            
        }
        
    }
}




