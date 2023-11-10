//
//  DownloadManager.swift
//  NetworkingHw8
//
//  Created by Andria Inasaridze on 10.11.23.
//

import Foundation

final class DownloadManager {
    
    static let shared: DownloadManager = DownloadManager()
    
    private init() {}
    
    // Using escaping Closures
    func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error Downloading Data")
                completionHandler(nil)
                return
            }
            completionHandler(data)
        }.resume()
    }
    
    // Using Modern Concurrency
//    func fetchData<T: Codable>(fromURL urlString: String) async throws -> T {
//        
//        guard let url = URL(string: urlString) else { throw GHError.invalidURL }
//        
//        // Perform the network request asynchronously
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw GHError.invalidResponse
//        }
//        // Parse JSON
//        do {
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            throw GHError.invalidData
//        }
//    }
    func fetchData(fromURL urlString: String) async throws -> Data {
        
        guard let url = URL(string: urlString) else { throw GHError.invalidURL }
        
        // Perform the network request asynchronously
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        return data
    }

}


enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
