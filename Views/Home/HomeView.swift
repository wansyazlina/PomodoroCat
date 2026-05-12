//
//  HomeView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    var onStart: () -> Void = { }

    var body: some View {
        ZStack {
            backgroundLayer

            VStack(spacing: 24) {
                Text("MY POMODORO CAT")
                    .font(.custom("VT323-Regular",size: 50, relativeTo: .title))
                    .foregroundStyle(.black)

                Text(viewModel.catName)
                    .font(.custom("Silkscreen",size: 30, relativeTo: .title))
                    .foregroundStyle(.black)

                catIntroView

                Text("slide to start")
                    .font(.custom("Silkscreen",size: 20, relativeTo: .caption))
                    .foregroundStyle(.black)

                SlideToStartView {
                    viewModel.startIntro()
                    onStart()
                }
            }
            .padding()
        }
        .frame(width: 600, height: 600)
    }
    
    
    private var backgroundLayer: some View {
         ZStack {
             Color.white
                 .ignoresSafeArea()

             /*
             Later when your pixel background is ready:

             Image("home_background")
                 .resizable()
                 .interpolation(.none)
                 .scaledToFill()
                 .ignoresSafeArea()
             */
         }
     }
    
    private var catIntroView: some View {
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 326, height: 252)
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 2)
                    )

                /*
                Later when your cat PNG is ready:

                Image(viewModel.catImageName)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                */

                Text("cat animation")
                    .font(.system(size: 22, weight: .regular, design: .monospaced))
            }
        }
    }
    
    

#Preview {
    HomeView()
   
}
