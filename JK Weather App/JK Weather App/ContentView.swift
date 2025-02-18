//
//  ContentView.swift
//  JK Weather App
//
//  Created by Janak Khadka on 18/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GeometryReader { geometry in  //GeometryReader le chai parent view vannale yaa chai Content view ko size and position reads garera adjust garna help garxa
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .fill(
                            Color(red: 138/255,green: 43/255, blue: 226/255)
                        )
                        .frame(height: geometry.size.height / 2.5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20.0)
                                .fill(Color.white.opacity(0.3))
                                .frame(width: .infinity,
                                       height: 200)
                                .overlay(
                                    VStack {
                                        HStack {
                                            Text("RIGHT NOW")
                                                .font(.system(size: 18, weight: .bold))
                                                .padding(.leading)
                                            Spacer()
                                        }
                                        .padding(.top)
                                        
                                        HStack {
                                            VStack {
                                                HStack {
                                                    Text("60\u{00B0}F")
                                                        .font(.system(size: 55, weight: .bold))
                                                        .padding(.leading)
                                                    Spacer()
                                                }
                                                HStack {
                                                    Text("Light Thunderstorm")
                                                        .font(.system(size: 20, weight: .bold))
                                                        .padding(.leading)
                                                        
                                                    Spacer()
                                                }
                                                
                                            }
                                            .padding(.top,0.1)
                                            
                                            Spacer()
                                            
                                            HStack {
              
                                                    Image(systemName: "cloud.bolt.fill")
                                                        .foregroundColor(.white)
                                                        .padding(.trailing)
                                                        .font(.system(size:68, weight: .bold))
                                                
                                            }
                                        }
                                        
                                        
                                        Spacer()
                                        HStack {
                                            Text("Kathmandu, Nepal")
                                                .font(.system(size: 20, weight: .bold))
                                                .padding(.leading)
                                                .opacity(0.6)
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                )
                                .padding(.top, 50)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.5), radius: 10)
                            
                        )
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}


#Preview {
    ContentView()
}
