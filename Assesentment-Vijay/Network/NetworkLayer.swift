//
//  AppDelegate.swift
//  Assesentment-Vijay
//
//  Created by Vijay Singh Raghav on 20/09/24.
//

import Foundation

protocol NetworkRequest {
    func performRequest<T: Decodable>(endpoint: EndPoint) async throws -> T
}

class URLSessionNetworkManager: NetworkRequest {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func performRequest<T: Decodable>(endpoint: EndPoint) async throws -> T {
        guard let requestUrl = URL(string: endpoint.baseURL + endpoint.path) else {
            throw NSError(domain: "Invalid URl", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URl"])
        }
                
        var request = URLRequest(url: requestUrl)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header    
        
        let (data, response) = try await session.data(for: request)
        
        NetworkLogger.prettyPrint(json: data, request: request, statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NSError(domain: "com.example.network", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid response"])
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NSError(domain: "com.example.network", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "HTTP Error"])
        }
        
        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
        return decodedResponse
    }
}

