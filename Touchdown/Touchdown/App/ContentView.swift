//
//  ContentView.swift
//  Touchdown
//
//  Created by Leo Merelo on 10/6/24.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject var shop: Shop
    //MARK: - BODY
    

    var body: some View {
       
        GeometryReader { geometry in
            ZStack {
                if shop.showingProduct == false && shop.selectedProduct == nil {
                    VStack(spacing: 0) {
                        NavigationBarView()
                            .padding(.horizontal, 15)
                            .padding(.bottom)
                            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                            .background(Color.white)
                            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 0) {
                                FeaturedTabView()
                                    .padding(.vertical, 20)
                                    .frame(width: geometry.size.width, height: geometry.size.height / 3)

                                CategoryGridView()
                                
                                TitleView(title: "Helmets")
                                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                                    ForEach(products) { product in
                                        ProductItemView(product: product)
                                            .onTapGesture {
                                                feedback.impactOccurred()
                                                withAnimation(.easeOut) {
                                                    shop.selectedProduct = product
                                                    shop.showingProduct = true
                                                }
                                            }
                                    }
                                })
                                .padding(15)
                                
                                TitleView(title: "Brands")
                                BrandGridView()
                                FooterView()
                                    .padding(.horizontal)
                            }//: VSTACK
                        }//: SCROLL
                      
                    } //: VSTACK
                    .background(colorBackground.ignoresSafeArea(.all, edges: .all))
                } else {
                    ProductDetailView()
                }
            } //: ZSTACK
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

/*func getSafeAreaTop()->CGFloat{

        let keyWindow = UIApplication.shared.connectedScenes

            .filter({$0.activationState == .foregroundActive})

            .map({$0 as? UIWindowScene})

            .compactMap({$0})

            .first?.windows

            .filter({$0.isKeyWindow}).first

        

        return (keyWindow?.safeAreaInsets.top)!

    }*/

//MARK: - PREVIEW
#Preview {
    ContentView()
        .environmentObject(Shop())
}
