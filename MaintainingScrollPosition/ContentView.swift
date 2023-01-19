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
    GeometryReader { scrollViewGeo in
      ScrollView {
        LazyVStack {
          ForEach(viewModel.list, id: \.self) { i in
            Text("\(i)")
              .id(i)
              .frame(height: 50)
              .background(GeometryReader { itemGeo in
                Color.clear
                  .onChange(of: itemGeo.frame(in: .named("list"))) { frame in
                    if frame.minY <= 0 && frame.maxY > 0 {
                      let y = frame.minY / (scrollViewGeo.size.height - frame.height)
                      viewModel.scrollPosition = ScrollPosition(id: i, anchor: .init(x: 0.5, y: y))
                    }
                  }
              })
          }
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
    .coordinateSpace(name: "list")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
