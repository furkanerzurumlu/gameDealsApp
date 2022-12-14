//
//  ViewController.swift
//  gameDeals
//
//  Created by Furkan Erzurumlu on 4.10.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController{
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dealsCollectionView: UICollectionView!
    
    var viewModel: HomePageVM = HomePageVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
        viewModel.delegate = self
        viewModel.getUpcomingData()

        dealsCollectionView.register(DealsCollectionViewCell.nibName, forCellWithReuseIdentifier: DealsCollectionViewCell.identifier)
        
        dealsCollectionView.delegate = self
        dealsCollectionView.dataSource = self
    }
    
    func setLayout(){
        navigationController?.title = "Game Deals"
        titleLabel.text = "Game Deals"
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dealsCollectionView.dequeueReusableCell(withReuseIdentifier: DealsCollectionViewCell.identifier, for: indexPath) as! DealsCollectionViewCell
        cell.gameTitle.text = "\(viewModel.data?[indexPath.row].title ?? "")"
        
        //cell.gameImage.downloaded(from: viewModel.data?[indexPath.row].thumb ?? "")
        let url = URL.init(string: "\(viewModel.data?[indexPath.row].thumb ?? "")")
        cell.gameImage.sd_setImage(with: url)
        
        
        cell.normalPrice.text = "Normal Price: $\(viewModel.data?[indexPath.row].normalPrice ?? "")"
        cell.dealPrice.text = "Deal Price: $\(viewModel.data?[indexPath.row].salePrice ?? "")"
        
        cell.dealRating.text = "\(viewModel.data?[indexPath.row].dealRating ?? "")"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.layer.frame.height - 600
        let width = view.layer.frame.width - 10
        return CGSize(width: width, height: height)
    }
}

extension ViewController: HomePageVMDelegateOutputs{
    func reloadCollectionView() {
        self.dealsCollectionView.reloadData()
    }
}
