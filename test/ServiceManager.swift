//
//  Service.swift
//  test
//
//  Created by Pedro Henrique on 16/04/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

final class ServiceManager {
    
    static let shared = ServiceManager()
    
    private init() {
        
    }
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://api-bank-iota.vercel.app/extrato"
    
    func getData<T: Decodable>(type: T.Type) -> Future<[T], Error> {
        return Future<[T], Error> { [weak self] promise in
            guard let self = self, let url = URL(string: self.baseURL) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse,
                          httpResponse.statusCode == 200 else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
}
