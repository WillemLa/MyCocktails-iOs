//
//  URLHelper.swift
//  MyCocktail
//
//  Created by Willem Lapage on 15/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

extension URL {
    //Zie voorbeeld boek (pg. 853) met 2 queries: dit url
    //https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2011-11-11
    
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
