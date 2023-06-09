//
//  MenuSelected.swift
//  HomeWork3
//
//  Created by Chinara on 5/23/23.
//

import SwiftUI

struct MenuSelected: View {
    var image: Image
    var title: String
    var descriptionMenu: String
    var purchaseOption: String
    var rating: String
    var timing: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 160, height: 180)
                .cornerRadius(30)
                .foregroundColor(.white)
                .shadow(radius: 5)
            VStack {
                image
                    .resizable()
                    .frame(width: 150, height: 150)
                    .offset(y: -60)
                VStack (alignment: .leading) {
                    CustomTextView(title: title, fontSize: 16, isBold: true, textColor: .black)
                    CustomTextView(title: descriptionMenu, fontSize: 10, isBold: true, textColor: .gray)
                    CustomTextView(title: purchaseOption, fontSize: 10, isBold: false, textColor: .gray)
                    HStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                        CustomTextView(title: rating, fontSize: 12, isBold: false, textColor: .gray)
                        Image(systemName: "clock")
                        CustomTextView(title: timing, fontSize: 12, isBold: false, textColor: .gray)
                        
                    }
                }
                .padding(.top, -80)
            }
        }
        .padding(.top, 60)
    }
}

 
    struct MenuSelected_Previews: PreviewProvider {
        static var previews: some View {
            MenuSelected(image: .init(""), title:.init(), descriptionMenu: .init(), purchaseOption: .init(), rating: .init(), timing: .init())
        }
    }


