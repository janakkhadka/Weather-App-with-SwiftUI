//
//  ContentView.swift
//  JK Weather App
//
//  Created by Janak Khadka on 18/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isSearching: Bool = false
    @State private var searchTextField: String = ""
    @State private var searchText: String = "Kathmandu, Nepal"
    
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
                                            if !isSearching {
                                                Text("\(searchText)")
                                                    .font(.system(size: 20, weight: .bold))
                                                    .padding(.leading)
                                                    .opacity(0.6)
                                                    .frame(height: 40)
                                            } else {
                                                TextField("Type a message...", text: $searchTextField)
                                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                                    .padding()
                                                    .background(.opacity(0))
                                                    .frame(height: 40)
                                                    .foregroundColor(.black)
                                            }
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                if(isSearching){
                                                    searchText = searchTextField
                                                }else {
                                                    searchTextField = ""
                                                }
                                                isSearching.toggle()
                                            }){
                                                Image(systemName: "magnifyingglass")
                                                    .foregroundColor(.white)
                                                    .padding(.trailing)
                                                    .font(.system(size:25, weight: .bold))
                                            }
                                        }
                                        Spacer()
                                    }
                                )
                                .padding(.top, 50)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.5), radius: 10)
                            
                        )
                    
                    //talako section
                    VStack {
                        HStack {
                            Spacer()
                            Text("58\u{00B0}F")
                                .font(.system(size: 55, weight: .bold))
                                .padding(.leading)
                            
                            Spacer()
                            
                            Text("62\u{00B0}F")
                                .font(.system(size: 55, weight: .bold))
                                .padding(.leading)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Text("LOW")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.leading)
                                .opacity(0.5)
                            
                            Spacer()
                            Spacer()
                            
                            Text("HIGH")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.leading)
                                .opacity(0.5)
                            
                            Spacer()
                        }
                        .padding(.bottom, 20)
                        
                        //arko section suru
                        VStack{
                            HStack {
                                HStack {
                                    Image(systemName: "wind")
                                        .font(.system(size:34, weight: .bold))
                                    
                                    Text("WIND")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading)
                                }
                                .padding(.horizontal, 10)
                                
                                Spacer()
                                
                                Text("6 MPH")
                                    .font(.system(size: 15, weight: .bold))
                                    .opacity(0.8)
                            }
                            .padding(.vertical, 10)
                            
                            Divider()
                            
                            HStack {
                                HStack {
                                    Image(systemName: "humidity")
                                        .font(.system(size:30, weight: .bold))
                                    
                                    Text("HUMIDITY")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading)
                                }
                                .padding(.horizontal, 10)
                                
                                Spacer()
                                
                                Text("55 %")
                                    .font(.system(size: 15, weight: .bold))
                                    .opacity(0.8)
                            }
                            .padding(.vertical, 10)
                            
                            Divider()
                            
                            HStack {
                                HStack {
                                    Image(systemName: "drop")
                                        .font(.system(size:25, weight: .bold))
                                        .padding(.horizontal, 5)
                                    
                                    Text("DEW POINT")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading)
                                }
                                .padding(.horizontal, 10)
                                
                                Spacer()
                                
                                Text("50\u{00B0}")
                                    .font(.system(size: 15, weight: .bold))
                                    .opacity(0.8)
                            }
                            .padding(.vertical, 10)
                            
                            Divider()
                            
                            HStack {
                                HStack {
                                    Image(systemName: "arrow.down")
                                        .font(.system(size:28, weight: .bold))
                                        .padding(.horizontal, 3)
                                    
                                    Text("PRESSURE")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading)
                                }
                                .padding(.horizontal, 10)
                                
                                Spacer()
                                
                                Text("30.01 In")
                                    .font(.system(size: 15, weight: .bold))
                                    .opacity(0.8)
                            }
                            .padding(.vertical, 10)
                            
                            Divider()
                            
                            HStack {
                                HStack {
                                    Image(systemName: "eye")
                                        .font(.system(size:23, weight: .bold))
                                    
                                    Text("VISIBILITY")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading)
                                }
                                .padding(.horizontal, 10)
                                
                                Spacer()
                                
                                Text("10.0 Mi")
                                    .font(.system(size: 15, weight: .bold))
                                    .opacity(0.8)
                            }
                            .padding(.vertical, 10)
  
                        }
                        .padding(.horizontal)
                        .background(.white)

                    }
                }
                .background(.gray.opacity(0.2))
            }
        }
        .edgesIgnoringSafeArea(.top)
        
        
    }
}


#Preview {
    ContentView()
}
