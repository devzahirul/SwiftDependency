//
//  File.swift
//  
//
//  Created by Hologram1 on 11/16/23.
//

import Foundation

protocol DependencyProvidable {
  var currentEnvironment: AppEnvironment { get set}
  var storage: [String: Any] { get set }
  func add<T>(dependency: T)
  func remove<T>(dependency: T)
  static func getDependency<T>() -> T
}
