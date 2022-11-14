//
//  RemoteDataSource.swift
//  Project
//
//  Created by Manu Rico on 10/11/22.
//

import Foundation
import Combine

struct HttpConstants {

    struct Methods {
        static let post = "POST"
        static let patch = "PATCH"
    }

    struct Headers {
        static let contentType = "Content-Type"
        static let applicationJson = "application/json"
        static let authorization = "Authorization"
        static let bearer = "Bearer"
    }
}

class RemoteDataSource {
    
    func fetch<T: Decodable>(from url: URL) -> AnyPublisher<T, DataError> {
        
        run(URLRequest(url: url))
    }
    
    func patch<T: Decodable, E: Encodable>(_ data: E, on url: URL) -> AnyPublisher<T, DataError> {
        
        do {
            let data = try JSONEncoder().encode(data)
            var request = URLRequest(url: url)
            request.httpMethod = HttpConstants.Methods.patch
            request.httpBody = data
            return run(request)
        } catch {
            return Fail(error: .unknown)
                .eraseToAnyPublisher()
        }
    }
    
    func post<T: Decodable, E: Encodable>(_ data: E, to url: URL) -> AnyPublisher<T, DataError> {

        do {
            let data = try JSONEncoder().encode(data)
            var request = URLRequest(url: url)
            request.httpMethod = HttpConstants.Methods.post
            request.httpBody = data
            return run(request)
        } catch {
            let error = DataError.decoding(error: NSError(domain: "\(error)", code: 0, userInfo: nil))
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
    
    private func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, DataError> {
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { output -> T in
                let response = output.response as? HTTPURLResponse
                let statusCode = response?.statusCode
                if statusCode != 200 && statusCode != 201 {
                    throw NSError(domain: "\(output.response)", code: statusCode ?? 500, userInfo: nil)
                }
                do {
                    let value = try JSONDecoder().decode(T.self, from: output.data)
                    return value
                } catch {
                    print("Decoding error: \(error)")
                    throw error
                }
            }
            .mapError { .network(error: $0) }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
