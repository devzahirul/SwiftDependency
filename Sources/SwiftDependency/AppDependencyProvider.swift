//
//  File.swift
//  
//
//  Created by Hologram1 on 11/16/23.
//

import Foundation

open class AppDependencyProvider: DependencyProvidable {
    var currentEnvironment: AppEnvironment
    var storage: [String : Any]
    static let shared = AppDependencyProvider()
    
    init(environment: AppEnvironment = .Dev, storage: [String : Any] = [:]) {
        self.currentEnvironment = environment
        self.storage = storage
    }
    
    func add<T>(dependency: T) {
        let dependencyKey = String(describing: T.self)
        self.storage[dependencyKey] = dependency
    }
    
    func remove<T>(dependency: T) {
        let dependencyKey = String(describing: T.self)
        self.storage.removeValue(forKey: dependencyKey)
    }
    
    static func getDependency<T>() -> T {
        AppDependencyProvider.shared.storage[String(describing: T.self)] as! T
    }
}
