import XCTest
@testable import SwiftDependency

final class SwiftDependencyTests: XCTestCase {
   func test_when_add_single_dependency() {
   //When
    let itemRepo = ItemRepository()
    let addItemUseCase = AddItemUseCase(repo: itemRepo)
    //Then
     DI.add(addItemUseCase)
     
     let itemViewModel = ItemViewModel()
     
     XCTAssertNotNil(itemViewModel.addItemUseCase)
     
   }
}
