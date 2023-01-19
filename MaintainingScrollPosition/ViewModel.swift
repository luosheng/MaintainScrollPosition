//
//  ViewModel.swift
//  MaintainingScrollPosition
//
//  Created by Luo Sheng on 2023/1/19.
//

import Foundation

class ViewModel: ObservableObject {
  @Published var list: [Int]
  
  init() {
    var list: [Int] = []
    for i in 0 ... 100 {
      list.append(i)
    }
    self.list = list
  }
}
