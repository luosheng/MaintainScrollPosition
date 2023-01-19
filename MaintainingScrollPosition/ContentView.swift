//
//  ContentView.swift
//  MaintainingScrollPosition
//
//  Created by Luo Sheng on 2023/1/19.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = ViewModel()
  @State var index = -1

  var body: some View {
    ScrollView {
      LazyVStack {
        ForEach(viewModel.list, id: \.self) { i in
          Text("\(i)")
            .frame(height: 50)
        }
      }
    }
    .toolbar {
      ToolbarItem {
        Button {
          viewModel.list.insert(index, at: 0)
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
