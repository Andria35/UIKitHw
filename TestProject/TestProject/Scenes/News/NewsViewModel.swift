//
//  NewsViewModel.swift
//  TestProject
//
//  Created by Nana Jimsheleishvili on 23.11.23.
//

import Foundation

protocol NewsViewModelDelegate: AnyObject {
    func newsFetched(_ news: [News])
    func showError(_ error: Error)
}

protocol NewsViewModel: AnyObject {
    var delegate: NewsViewModelDelegate? { get set }
    func viewDidLoad()
}

final class DefaultNewsViewModel: NewsViewModel {
    
    // MARK: - Properties
    
    // "message": "You are trying to request results too far in the past. Your plan permits you to request articles as far back as 2023-10-22, but you have requested 2021-11-11. You may need to upgrade to a paid plan."
    private let newsAPI = "https://newsapi.org/v2/everything?q=tesla&from=2023-10-25&sortBy=publishedAt&apiKey=ce67ca95a69542b484f81bebf9ad36d5"
    
    private var newsList = [News]()

    weak var delegate: NewsViewModelDelegate?

    // MARK: - Public Methods
    func viewDidLoad() {
        fetchNews()
    }
    
    // MARK: - Private Methods
    private func fetchNews() {
        NetworkManager.shared.get(url: newsAPI) { [weak self] (result: Result<Article, Error>) in
            // რადგან ამდენი self ის გამოყენება გვიწევს guard ჯობია
            guard let self else { return }
            switch result {
            case .success(let article):
//                self.delegate?.newsFetched(self.newsList)
                self.newsList.append(contentsOf: article.articles)
                self.delegate?.newsFetched(self.newsList)
            case .failure(let error):
                self.delegate?.showError(error)
            }
        }
    }
}

