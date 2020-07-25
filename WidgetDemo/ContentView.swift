//
//  ContentView.swift
//  WidgetDemo
//
//  Created by Rahul Patel on 19/07/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State var show = false
    @State var progress: CGFloat = 0.0
    @Namespace var namespace
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                HStack(spacing: 15) {
                    Image("Song")
                        .resizable()
                        .frame(width: self.show ? 250 : 50, height: self.show ? 250 : 50)
                        .padding(.top, self.show ? 16 : 0)
                    
                    //// Show when small
                    if !self.show {
                        VStack(alignment : .leading, spacing: 2) {
                            Text("Never Say Never")
                            Text("Justin Bieber")
                                .foregroundColor(.red)
                        }
                        .matchedGeometryEffect(id: "Details", in: self.namespace)
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "play.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        .matchedGeometryEffect(id: "playButton", in: self.namespace)
                    }
                }
                if self.show {
                    VStack(alignment : .center, spacing: 4) {
                        Text("Never Say Never")
                        Text("Justin Bieber")
                            .foregroundColor(.red)
                    }
                    .matchedGeometryEffect(id: "Details", in: self.namespace)
                    
                    Slider(value: self.$progress)
                        .padding(.all, 16)
                    HStack(spacing: 16) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "backward.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "play.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                        .matchedGeometryEffect(id: "playButton", in: self.namespace)
                        
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "forward.fill")
                                .font(.title)
                                .foregroundColor(.black)
                        })
                    }
                    .padding(.all, 16)
                    
                    Spacer()
                }
            }
            .padding(.all, 8)
            .background(Color.white.shadow(radius: 3)
                            .onTapGesture {
                                withAnimation(Animation.easeOut(duration: 0.4)) {
                                    self.show.toggle()
                                }
                            })
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
