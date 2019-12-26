//
//  URLHelper.swift
//  MyCocktail
//
//  Created by Willem Lapage on 15/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

extension URL {

    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
