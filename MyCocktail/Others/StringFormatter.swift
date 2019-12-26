//
//  StringFormatter.swift
//  MyCocktail
//
//  Created by Willem Lapage on 11/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

extension String {

     func getImageNameFormatted() -> String {
        return self.replacingOccurrences(of: "/", with: "")
    }

}
