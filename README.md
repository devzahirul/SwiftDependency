# SwiftDependency

## Swift Dependency Injection Example

This is a simple Swift implementation of a Dependency Injection (DI) framework. The code includes an `AppEnvironment` enum representing different application environments and a `DependencyProvidable` protocol for managing dependencies.

## AppEnvironment Enum

```swift
enum AppEnvironment {
  case Testing
  case Dev
  case Production
  case Staging
}
```

The AppEnvironment enum represents different application environments, allowing for configuration based on the current deployment stage.

## DependencyProvidable Protocol
```swift
protocol DependencyProvidable {
  var currentEnvironment: AppEnvironment { get set }
  var storage: [String: Any] { get set }
  func add<T>(dependency: T)
  func remove<T>(dependency: T)
  static func getDependency<T>() -> T
}

```
The DependencyProvidable protocol defines the contract for managing dependencies. It includes methods for adding, removing, and retrieving dependencies based on their type.

## AppDependencyProvider Class
```swift
class AppDependencyProvider: DependencyProvidable {
  var currentEnvironment: AppEnvironment
  var storage: [String : Any]
  static let shared = AppDependencyProvider()
  
  init(environment: AppEnvironment = .Dev, storage: [String : Any] = [:]) {
      self.currentEnvironment = environment
      self.storage = storage
  }
  
  func add<T>(dependency: T) {
      let dependencyKey = String(describing: T.self)
      self.storage[String(describing: T.self)] = dependency
  }
  
  func remove<T>(dependency: T) {
      let dependencyKey = String(describing: T.self)
      self.storage.removeValue(forKey: dependencyKey)
  }
  
  static func getDependency<T>() -> T {
      AppDependencyProvider.shared.storage[String(describing: T.self)] as! T
  }
}

```
## How to use in App
Add Swift Package 
```swift
https://github.com/devzahirul/SwiftDependency.git
```
Then, import & add dependency in your application start 
```swift
import SwiftUI
import SwiftDependency


@main
struct CleanArchectureApp: App {
    
    init() {
       // manage dependency 
      let orderFlowDataSource = OrderFlowDataSource()
      let orderRepo = OrderFlowRepository(dataSource: orderFlowDataSource)
      let addOrderItemUseCase = AddOrderItemUseCase(repo: orderRepo)
      
      //add dependency
      DI.add(addOrderItemUseCase)
      
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


```
Then use `@Inject` PropertyWrapper inside your ViewModel. Here an example of `OrderFlowViewModel`
```swift
import Combine
import SwiftDependency

class OrderFlowViewModel: ObservableObject {
    // inject usecases using @Inject propertywrapper
    @Inject<AddOrderItemUseCase> private var orderItemUseCase
    
    // published
    @Published private var addItemStatus: Bool = false
    
    func addInOrderFlow(orderItem: OrderItem) async {
       let result = await orderItemUseCase.execute(requestModel: orderItem)
       
       switch result {
         case .success(let addStatus): do {
         self.addItemStatus = addStatus
         print("Item add status: \(addStatus)")}
         case .failure(let error): do { print("Fail to add item: \(error.localizedDescription)")}
       }
    }
}

```
### Feel free to use and modify this code according to your project's requirements. If you have any questions or improvements, please feel free to contribute or reach out.
