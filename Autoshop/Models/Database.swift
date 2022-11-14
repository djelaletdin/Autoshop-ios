//
//  Database.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import Foundation

final class Database {
    private let FAV_KEY = "fav_key"
    
    func save(items: Set<Int>) {
        let array = Array(items)
        UserDefaults.standard.set(array, forKey: FAV_KEY)
    }
    
    func load() -> Set<Int> {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return Set(array)
    }
    
    func get() -> [Int] {
        let array = UserDefaults.standard.array(forKey: FAV_KEY) as? [Int] ?? [Int]()
        return array
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
