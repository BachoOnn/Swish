//
//  Config.swift
//  Config
//
//  Created by Bacho on 17.01.26.
//

import Foundation

public protocol Config {
    var DEBUG: Bool { get }
    var BALLDONTLIE_API_KEY: String { get }
    var BALLDONTLIE_BASE_URL: String { get }
    var ESPN_NEWS_URL: String { get }
}

extension Bundle: Config {
    
    public var DEBUG: Bool {
        object(forInfoDictionaryKey: "DEBUG") as! Bool
    }
    
    public var BALLDONTLIE_API_KEY: String {
        object(forInfoDictionaryKey: "BALLDONTLIE_API_KEY") as! String
    }
    
    public var BALLDONTLIE_BASE_URL: String {
        object(forInfoDictionaryKey: "BALLDONTLIE_BASE_URL") as! String
    }
    
    public var ESPN_NEWS_URL: String {
        object(forInfoDictionaryKey: "ESPN_NEWS_URL") as! String
    }
}
