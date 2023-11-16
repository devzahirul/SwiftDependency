
import Foundation

open class SwiftDependency {
    public static func add<T>(_ value: T) {
    AppDependencyProvider.shared.add(dependency: value)
  }
  
    public static func remove<T>(_ value: T) {
   AppDependencyProvider.shared.remove(dependency: value)
  }
    public static func setUpEnvironment(environment: AppEnvironment) {
    AppDependencyProvider.shared.currentEnvironment = environment
  }
}

public typealias DI = SwiftDependency
