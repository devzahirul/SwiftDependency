//
//  File.swift
//  
//
//  Created by Hologram1 on 11/16/23.
//

import Foundation

@propertyWrapper public struct Inject<T> {
  public init(){}
  public var wrappedValue: T {
    get {
      return AppDependencyProvider.getDependency()
    }
  }
}
