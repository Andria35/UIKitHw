//
//  ProductsListViewModel.swift
//  Store
//
//  Created by Baramidze on 25.11.23.
//

import Foundation

protocol ProductsListViewModelDelegate: AnyObject {
    func productsFetched(products: [ProductModel])
    func productsAmountChanged()
    func handleError(error: Error)
}

class ProductsListViewModel {

    weak var delegate: ProductsListViewModelDelegate?
    
    var products: [ProductModel]?
    var totalPrice: Double? { products?.reduce(0) { $0 + $1.price * Double(($1.selectedAmount ?? 0))} }
    
    func viewDidLoad() {
        fetchProducts()
    }
    
    private func fetchProducts() {
        NetworkManager.shared.fetchProducts { [weak self] response in
            switch response {
            case .success(let products):
                self?.products = products
                self?.delegate?.productsFetched(products: products)
            case .failure(let error):
                //TODO: handle Error
                self?.delegate?.handleError(error: error)
                break
            }
        }
    }
    
    func addProduct(at index: Int) {
        //TODO: handle if products are out of stock
        guard var product = products?[index] else {
            print("There is no product on this index")
            return
        }
        if product.stock <= 0 {
            print ("Product is out of stock")
        } else {
            product.selectedAmount = (products?[index].selectedAmount ?? 0 ) + 1
            products?[index].selectedAmount = product.selectedAmount
            delegate?.productsAmountChanged()
        }
    }
    
    func removeProduct(at index: Int) {
        guard var product = products?[index] else {
            print("There is no product on this index")
            return
        }
        //TODO: handle if selected quantity of product is already 0
        if product.selectedAmount ?? 0 > 0 {
            product.selectedAmount = (products?[index].selectedAmount ?? 0) - 1
            products?[index].selectedAmount = product.selectedAmount
            products?[index].selectedAmount = product.selectedAmount
            delegate?.productsAmountChanged()
        } else {
            print("Selected quantity is already 0.")
        }
    }
}
