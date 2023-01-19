//
//  ViewModel.swift
//  MaintainingScrollPosition
//
//  Created by Luo Sheng on 2023/1/19.
//

import Foundation
import SwiftUI

struct ScrollPosition<T: Hashable> {
  let id: T
  let anchor: UnitPoint
}

class ViewModel: ObservableObject {
  @Published var list: [Int]
  @Published var scrollPosition: ScrollPosition<Int>?
  
  init() {
    var list: [Int] = []
    for i in 0 ... 100 {
      list.append(i)
    }
    self.list = list
  }
}
