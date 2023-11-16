//
//  File.swift
//  
//
//  Created by Hologram1 on 11/16/23.
//

import Foundation
@testable import SwiftDependency

struct Item {
  let itemName: String
  let createAt: String
}


class AddItemUseCase {
  private var repo: ItemRepository
    init(repo: ItemRepository) {
        self.repo = repo
    }
  func execute(item: Item){}
}

class ItemRepository {
  func add(item: Item){}
  func delete(item: Item) {}
}


class ItemViewModel {
@Inject<AddItemUseCase> var addItemUseCase
}
