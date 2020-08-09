//
//  RealmDatabase.swift
//  game catalog
//
//  Created by Aldo Vernando on 8/9/20.
//  Copyright © 2020 aldovernando. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {

    static var realm: Realm {
        do {
            let realm = try Realm()
            return realm
        }
        catch {
            print("Could not access database: \(error)")
        }
        return self.realm
    }


    static func insert(data: Object) {
        do {
            try realm.write() {
                realm.add(data)
            }
        } catch {
            print("Error insert : \(error)")
        }
    }

    static func get(data: Object.Type) -> Results<Object> {
        let results = realm.objects(data)
        
        return results
    }

    static func remove(data: Object) {
        do {
            try realm.write {
                realm.delete(data)
            }
        } catch {
            print("Error delete : \(error)")
        }
    }

}
