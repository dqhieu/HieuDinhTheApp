//
//  ContentView.swift
//  HieuDinhTheApp
//
//  Created by Dinh Quang Hieu on 06/04/2023.
//

import SwiftUI

struct ProfilePhotoView: View {

  @State private var rotateDegree = -10800.0
  @State private var scale = 0.0
  private let maxClockCount = 5
  @State private var clockCount = 0


  var body: some View {
    ZStack {
      ZStack {
        Color
          .orange
          .frame(width: 100, height: 100)
          .blur(radius: 50)
          .offset(x: -20, y: -20)
        Color
          .red
          .frame(width: 100, height: 100)
          .blur(radius: 50)
          .offset(x: -20, y: 20)
        Color
          .purple
          .frame(width: 100, height: 100)
          .blur(radius: 50)
          .offset(x: 20, y: 20)
        Color
          .blue
          .frame(width: 100, height: 100)
          .blur(radius: 50)
          .offset(x: 20, y: -20)
      }
      .rotationEffect(.degrees(rotateDegree))
      .onAppear {
        withAnimation(.easeOut(duration: 10)) {
          rotateDegree = 0
        }
        withAnimation(.linear(duration: 1).speed(0.5).repeatForever(autoreverses: false).delay(9)) {
          rotateDegree = 360
        }
      }
      Image("profile")
        .resizable()
        .scaledToFit()
        .frame(width: 160, height: 160)
        .cornerRadius(80)
        .shadow(color: .secondary.opacity(0.5), radius: 4)
    }
    .scaleEffect(scale)
    .onAppear {
      withAnimation(.easeInOut(duration: 1)) {
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
