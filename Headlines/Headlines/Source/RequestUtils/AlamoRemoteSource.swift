//
//  AlamoSource.swift
//  Headlines
//
//  Created by Lorien Moisyn on 14/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

public class AlamoRemoteSource {
    
    private let manager = SessionManager.default
    private let baseURL = URL(string: "https://newsapi.org/v2/top-headlines")!
    private var parameters: [String: String] = [:]
    
    public func getTopHeadlines() -> Single<NoContent> {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        parameters["apiKey"] = "0a30c22796004890a22d42bb0e697237"
        parameters["country"] = "us"
        
        return URLEncoding.default
            .encode(request, with: parameters)
            .flatMap { request in
                self.manager
                    .request(request)
                    .responseData(queue: DispatchQueue.global())
                }
            .map { (data, resp) in
                    return NoContent(data: data)
            }.do(onError: { error in
                print("Error: \(error)")
            }).asSingle()
    }
    
}

public struct NoContent: Decodable {
    
    private(set) var responseValue: String? = nil
    
    public init(data: Data?) {
        guard data != nil else { return }
        self.responseValue = String(data: data!, encoding: String.Encoding.utf8)
    }
    
}
