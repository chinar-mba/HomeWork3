//
//  ContentView.swift
//  HomeWork3
//
//  Created by Chinara on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var textFromTF: String = ""
    @State var selectIndex: Int = 0
    
    var iconArray: [Image] = [Image(systemName: "line.horizontal.3.decrease"),
                              Image("image4"),
                              Image("image5"),
                              Image("image6"),
                              Image("image7")]
    var iconTitle: [String] = ["Delivery", "Take Away Food", "Bell Service", "Delivery", "Price"]
    
    
    private let menu: [MenuModel] = [
        MenuModel(image: Image("image1"), title: "Tony Roma's", descriptionMenu: " Ribs&Steaks", purchaseOption: "Deliver: FREE • Minimum: $20", rating: "4.5", timing: "35 Mins"),
        MenuModel(image: Image("image2"), title: "Momos", descriptionMenu: "Japanese", purchaseOption: "Deliver: FREE • Minimum: $10", rating: "4.6", timing: "30 Mins"),
        MenuModel(image: Image("image3"), title: "Paul", descriptionMenu: "French pasta", purchaseOption: "Deliver: FREE • Minimum: $10", rating: "5.5", timing: "25 Mins")]
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Color.white
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
            }
            VStack(alignment: .leading, spacing: 7) {
                NavBarView()
                
                HStack {
                    ForEach(0..<5) { index in
                        HorizontalSliderView(image: iconArray[index],
                                             title: iconTitle[index], isSelect: selectIndex == index)
                        .padding()
                        .onTapGesture {
                            selectIndex = index
                        }
                        
                        
                    }
                    
                }
                CustomTextView(title: "  56 stores open", fontSize: 20, isBold: true, textColor: .black)
                    .padding(.leading)
                SearchBarView(textFromTF: $textFromTF)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(menu, id: \.self) { index in
                            MenuSelected(image: index.image, title: index.title, descriptionMenu: index.descriptionMenu, purchaseOption: index.purchaseOption, rating: index.rating, timing: index.timing)
                                .padding()
                        }
                        
                    }
                }
                .padding()
                
                MenuDetail()
                
                
            }
            
            TabBar()
        }
       
    }
}

        
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NavBarView: View {
    @State private var showNextScreen = false
    var body: some View {
        HStack {
            CustomButton(image: Image(systemName:"line.horizontal.3.decrease")) {
                //
            }
            Spacer()
            Button {
                self.showNextScreen = true
            } label: {
                VStack(alignment: .center) {
                    CustomTextView(title: "                 Delivering to", fontSize: 16, isBold: false, textColor: .gray)
                    HStack (){
                        CustomTextView(title: "               ManasAve", fontSize: 18, isBold: true, textColor: .black)
                        Image(systemName: "square.and.arrow.down.fill")
                    }
                }
                .sheet(isPresented: $showNextScreen) {
                    ThirdView()
                        .foregroundColor(.black)
                }
                Spacer()
                CustomButton(image: Image("basket")) {
                    //
                }
                .padding(.all)
                .background(.black)
                .cornerRadius(20)
                .shadow(radius: 3)
                .frame(width: 50, height: 47)
                
            }
            .padding(.horizontal)
        }
    }
}
struct HorizontalSliderView: View {
    var image: Image
    var title: String
    var isSelect: Bool
    
    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isSelect ? .white : .black)
            if isSelect {
                CustomTextView(title: title, fontSize: 12, isBold: true, textColor: .black)
            }
        }
        .frame(width: isSelect ? 100 : 30, height: 40)
        .background(isSelect ? .gray : .clear)
        .foregroundColor(isSelect ? .white : .black)
        .cornerRadius(10)
        
        
    }
}

        


struct SearchBarView: View {
    @Binding var textFromTF: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Find restaurant by name", text: $textFromTF)
            }
            .padding(.all)
            .background(.white)
            .cornerRadius(10)
            .shadow(radius: 3)
            
            
            
            Button {
                //
            } label: {
                VStack {
                    Image("vector1")
                        .resizable()
                        .frame(width: 24, height: 7.5)
                        .foregroundColor(.black)
                    Image("vector2")
                        .resizable()
                        .frame(width: 24, height: 7.5)
                        .foregroundColor(.black)
                    Image("vector1")
                        .resizable()
                        .frame(width: 24, height: 7.5)
                        .foregroundColor(.black)
                }
                .padding()
            }
            
        }
    }
}



struct MenuDetail: View {
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


struct TabBar: View {
    var body: some View {
        VStack {
            TabView {
                Text("Home")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .padding()
                Text("Wallet")
                    .tabItem {
                        Image(systemName: "creditcard")
                        Text("Wallet")
                    }
                    .padding()
                
                Text("Comment")
                    .tabItem {
                        Image(systemName: "message")
                        
                        Text("Comment")
                    }
                    .padding()
                
                Text("Profile")
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .padding()
            }
           
            .background(Color.black)
            .foregroundColor(.black)
            
        }
        .foregroundColor(.black)
        .background(Color.black)
        .frame(width: 335, height: 75)
        .cornerRadius(20)
       
      
    }
      
}
