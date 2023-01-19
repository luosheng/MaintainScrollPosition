//
//  ContentView.swift
//  MaintainingScrollPosition
//
//  Created by Luo Sheng on 2023/1/19.
//

import SwiftUI

struct ContentView: View {
  @State var list: [Int]
  @State var index = -1

  init() {
    var list: [Int] = []
    for i in 0 ... 100 {
      list.append(i)
    }
    _list = State(initialValue: list)
  }

  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(list, id: \.self) { i in
          Text("\(i)")
            .frame(height: 50)
        }
      }
    }
    .toolbar {
      ToolbarItem {
        Button {
          list.insert(index, at: 0)
          self.index = index - 1
        } label: {
          Image(systemName: "plus")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
