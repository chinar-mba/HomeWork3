//
//  ThirdView.swift
//  HomeWork3
//
//  Created by Chinara on 5/23/23.
//

import SwiftUI

struct ThirdView: View {
    @State var selectIndex: Int = 0
    
    var iconArray: [Image] = [Image("Delivery1"),
                              Image("Delivery2"),
                              Image(systemName: "house"),
                              Image("work"),
                              Image("hotel")]
    var iconTitle: [String] = ["Delivery to curent location", "Manase ave", "Delivery to different location", "Victory ave", "Home","Jukeev-Pudovkin st 43", "Work","Manas ave 34", "Hotel", "Frunze st 197"]
    
    var iconAddress: [String] = ["Manase ave", "Victory ave", "Jukeev-Pudovkin st 43", "Manas ave 34", "Frunze st 197"]
    
    var body: some View {
        
    ScrollView {
        VStack {
                ForEach(0..<5) { index in
                    DeliveryLocation(image: iconArray[index],
                                     title: iconTitle[index],
                                    address: iconAddress[index])
                            
                            .padding()
                            .onTapGesture {
                                
                            }
                        }
                    }
                        Spacer()
                        MenuDetail1()
                        Spacer()
                        TabBar1()
                    }
    .navigationTitle("ThirdView")
                }
            }
        
        
        struct ThirdView_Previews: PreviewProvider {
            static var previews: some View {
                ThirdView()
            }
        }
        
        struct MenuDetail1: View {
            var body: some View {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Paul")
                            .font(.system(size: 16))
                            .bold()
                        Text("Fresh Pasta")
                            .font(.system(size: 10))
                            .foregroundColor(Color.gray)
                        HStack {
                            Text("Delivery: FREE")
                                .font(.system(size: 10))
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 10, height: 9.54)
                                .foregroundColor(.black)
                            Text("4.5")
                                .font(.system(size: 12))
                                .bold()
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                            Image(systemName: "clock")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("25 min")
                                .font(.system(size: 12))
                                .bold()
                        }
                    }
                    .padding(.all)
                    
                    Spacer()
                    
                    VStack {
                        Image("image3")
                            .resizable()
                            .frame(width: 150, height: 150)
                    }
                }
                .background(Color.white)
                .frame(width: 330, height: 130)
                .cornerRadius(30)
                .shadow(radius: 3)
                Spacer()
            }
        }
        
        struct TabBar1: View {
            
            
            var body: some View {
                Spacer()
                VStack (spacing: 50) {
                    TabView {
                        Text("Home")
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        
                        Text("Wallet")
                            .tabItem {
                                Image(systemName: "creditcard")
                                Text("Wallet")
                            }
                        
                        Text("Comment")
                            .tabItem {
                                Image(systemName: "message")
                                
                                Text("Comment")
                            }
                        
                        Text("Profile")
                            .tabItem {
                                Image(systemName: "person")
                                Text("Profile")
                            }
                    }
                    
                    .background(Color.black)
                    
                }
                .background(Color.black)
                .frame(width: 335, height: 75)
                .background(Color.black)
                .cornerRadius(20)
                Spacer()
                    .padding(.vertical)
            }
            
        }
        

        
    struct DeliveryLocation: View {
            var image: Image
            var title: String
            var address: String
            
            var body: some View {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        image
                            .padding(.trailing)
                        VStack {
                            CustomTextView(title: title, fontSize: 16, isBold: true, textColor: .black)
                            CustomTextView(title: address, fontSize: 12, isBold: false, textColor: .gray)
                        }
                    }
                    Divider()
                    
                }
                .padding(.horizontal)
                
            }
        }
    
