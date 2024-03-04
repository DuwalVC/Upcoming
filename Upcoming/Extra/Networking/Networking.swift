//
//  Networking.swift
//  Upcoming
//
//  Created by dvarillc on 3/03/24.
//

import Foundation
import Alamofire

struct ParametersFunctionRequest{
    init(url: String, httpMethod: HttpMethod = .get, body: [String: Any]? = nil, headers: [String: String]? = nil, token: Bool = false) {
        self.url = url
        self.httpMethod = httpMethod
        self.body = body
        self.headers = headers
        self.token = token
    }
    
    let url: String
    let httpMethod: HttpMethod
    let body: [String: Any]?
    let headers: [String: String]?
    let token: Bool
}

class ClientHTTP {
    let domain: String
    
    init(domain: String) {
        self.domain = domain
    }
    
    private func addParameterBody(with parameters: [String:Any]) throws -> Data? {
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters) else {
            throw ErrorsClientHTTP.clientHTTP(description: "Error addParameterBody")
        }
        return httpBody
    }
    
    private func addHeaders(urlRequest: inout URLRequest ,headers: [String: String]){
        for h in headers {
            urlRequest.addValue(h.value, forHTTPHeaderField: h.key)
        }
    }
    
    func request<T:Decodable>(_ params: ParametersFunctionRequest, type: T.Type) async throws -> T {

        guard let generateURL = URL(string: domain + params.url) else {
            throw ErrorsClientHTTP.clientHTTP(description: "Error generateURL")
        }
        var urlRequest = URLRequest(url: generateURL)
        urlRequest.httpMethod = params.httpMethod.rawValue
        urlRequest.addValue("App", forHTTPHeaderField: "X-Application")
        
        if params.token {
            urlRequest.addValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZTZhOTQzZTI1MjZkMTExNzQxNzVhNTcwNTczOGYzYSIsInN1YiI6IjY1ZGZlZGEwODgwYzkyMDE2MzI2ZDQ3NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Z-LzUf7R9RAKJ15iWPn7f92vS2y2OwtXMO_Itd_q3RY", forHTTPHeaderField: "Authorization")
        }
        if let headers = params.headers {
            addHeaders(urlRequest: &urlRequest, headers: headers)
        }
        if let body = params.body {
            urlRequest.httpBody = try addParameterBody(with: body)
        }
        
        let (data, urlSession) = try await URLSession.shared.data(for: urlRequest)
        print(data)
        print(urlSession)
        let httpResponse = urlSession as! HTTPURLResponse
        let statusCode = httpResponse.statusCode
        
        if (200..<300).contains(statusCode) {
        
            let dataDecode = try JSONDecoder().decode(type, from: data)
            print(dataDecode)
            return dataDecode
        
        } else if statusCode == 401 {
            throw ErrorsClientHTTP.clientHTTP(description: "Error generic")
        } else {
            throw ErrorsClientHTTP.clientHTTP(description: "Error generic")
        }
    }
}
