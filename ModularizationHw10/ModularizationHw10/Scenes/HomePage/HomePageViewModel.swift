//
//  HomePageViewModel.swift
//  ModularizationHw10
//
//  Created by Andria Inasaridze on 19.11.23.
//

import Foundation
import NetworkingManager

protocol HomePageViewModelDelegate: AnyObject {
    func catFactsFetched(_ catFacts: [CatFact])
    func showError(_ error: Error)
}

final class HomePageViewModel {
    
    // MARK: - Class Properties
    private let networkingManager = NetworkingManager()
    weak var delegate: HomePageViewModelDelegate?
    
    //MARK: - Class Methods
    func viewDidLoad() {
        Task {
            await fetchCatFacts()
        }
    }
    
    private func fetchCatFacts() async {
        let urlString = "https://catfact.ninja/facts?limit=50"
        do {
            let catFactsResponse: CatFactsResponse = try await networkingManager.fetchData(fromURL: urlString)
            await MainActor.run {
                delegate?.catFactsFetched(catFactsResponse.data)
            }
        } catch {
            print("Error: \(error)")
            delegate?.showError(error)
        }
    }
}
