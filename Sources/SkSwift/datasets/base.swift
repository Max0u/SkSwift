//
//  File.swift
//  
//
//  Created by Maxime Blanc on 17/10/2020.
//

import Foundation 

public struct Datasets {
        
    static public func get_data_home(_ data_home: String? = nil) -> String {
        var data_home_res = data_home ?? ProcessInfo.processInfo.environment["SCIKIT_LEARN_DATA"] ?? "~/scikit_learn_data"
        data_home_res = data_home_res.expandingTildeInPath
        
        if !FileManager.default.fileExists(atPath: data_home_res) {
            do {
                try FileManager.default.createDirectory(atPath: data_home_res, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription);
            }
        }
        return data_home_res
    }
    
    static public func clear_data_home(_ data_home: String? = nil) {
        let fileManager = FileManager.default
        let data_home = get_data_home(data_home)
        do {
            try fileManager.removeItem(atPath: data_home)
        }
        catch let error as NSError {
            print("Can't remove data: \(error)")
        }
    }
}

public extension String {

    var expandingTildeInPath: String {
        return NSString(string: self).expandingTildeInPath
    }

}
