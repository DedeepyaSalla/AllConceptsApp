//
//  URLSnBundles.swift
//  MusicApp
//
//  Created by dedeepya reddy salla on 26/05/23.
//

import Foundation

struct URLSnBundles {
    
    func getResource() {
        // Access bundled resource in code
        if let resourcePath = Bundle.main.path(forResource: "example", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: resourcePath))
                // Process the JSON data
            } catch {
                // Handle error
            }
        }
        }

}
