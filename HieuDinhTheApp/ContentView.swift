//
//  ContentView.swift
//  HieuDinhTheApp
//
//  Created by Dinh Quang Hieu on 06/04/2023.
//

import SwiftUI

struct ProfilePhotoView: View {

  @State private var isRotating = 0.0
  @State private var scale = 0.0

  var body: some View {
    ZStack {
      ZStack {
        Color
          .yellow
          .frame(width: 100, height: 100)
        //          .cornerRadius(20)
          .blur(radius: 50)
          .offset(x: -20, y: -20)
        Color
          .red
          .frame(width: 100, height: 100)
        //          .cornerRadius(20)
          .blur(radius: 50)
          .offset(x: -20, y: 20)
        Color
          .purple
          .frame(width: 100, height: 100)
        //          .cornerRadius(20)
          .blur(radius: 50)
          .offset(x: 20, y: 20)
        Color
          .blue
          .frame(width: 100, height: 100)
        //          .cornerRadius(20)
          .blur(radius: 50)
          .offset(x: 20, y: -20)
      }
      //      .cornerRadius(80)
      .rotationEffect(.degrees(isRotating))
      .onAppear {
        withAnimation(.linear
          .speed(0.05).repeatForever(autoreverses: false)) {
            isRotating = 720.0
          }
      }
      Image("profile")
        .resizable()
        .scaledToFit()
        .frame(width: 200, height: 200)
        .cornerRadius(100)
    }
    .scaleEffect(scale)
    .onAppear {
      withAnimation(.spring()) {
        scale = 1
      }
    }
    .padding()
  }
}

struct ContentView: View {

  @State var id = UUID()

  var body: some View {
    VStack {
      ProfilePhotoView()
        .onTapGesture {
          id = UUID()
          UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        }
    }
    .padding()
    .id(id)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
