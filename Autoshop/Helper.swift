//
//  Helper.swift
//  A small collection of quick helpers to avoid repeating the same old code.
//
//  Created by Paul Hudson on 23/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from urlString: String) -> T {
        guard let url = URL(string: urlString) else {
            fatalError("Failed to locate \(urlString) in bundle.")
        }
        

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(urlString) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(urlString) from bundle.")
        }

        return loaded
    }
}
