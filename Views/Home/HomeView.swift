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

            VStack(spacing: 10) {
                Text("MY POMODORO CAT")
                    .font(.custom("VT323-Regular", size: 46, relativeTo: .title))
                    .foregroundStyle(.black)

                Text(viewModel.catName)
                    .font(.custom("Silkscreen", size: 20, relativeTo: .title))
                    .foregroundStyle(.black)

                catIntroView

                VStack(spacing: 3) {
                    Text("slide to start")
                        .font(.custom("ArchitypeStedelijkW00", size: 18, relativeTo: .caption))
                        .foregroundStyle(.black)

                    SlideToStartView {
                        viewModel.startIntro()
                        onStart()
                    }
                }
            }
            .padding()
        }
        .frame(width: 450, height: 450)
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

            Image("cat_idle_0")
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: 230, height: 230)
                .border(Color.red, width: 2)
        }
    }
    }
    
    

#Preview {
    HomeView()
   
}
