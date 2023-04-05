//
//  Home.swift
//  AnimatedStickyHeader
//
//  Created by Bilal Durnagöl on 4.04.2023.
//

// 5:31'de kaldık

import SwiftUI

struct Home: View {
    
    
    @State var activeTab: ProductType = .iphone
    @Namespace var animation
    @State var productsBasedOnTpe: [[Product]] = []
    var body: some View {
        // For auto scrolling conten's
        ScrollViewReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                /// lazy stack for pinnig view at top while
                LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(productsBasedOnTpe, id: \.self) { product in
                            ProductSectionView(product)
                        }
                    } header: {
                        ScrollableTabs(proxy)
                    }

                }
            }
        }
        /// for scroll content offset
        .coordinateSpace(name: "CONTENTVIEW")
        .navigationTitle("Apple Store")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.red, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .background {
            Rectangle()
                .fill(Color(uiColor: .systemGray4))
                .ignoresSafeArea()
        }
        .onAppear {
            guard productsBasedOnTpe.isEmpty else { return }
            
            for type in ProductType.allCases {
                let products = products.filter { $0.type == type}
                productsBasedOnTpe.append(products)
            }
        }
    }
    
    /// Product sectioned view
    @ViewBuilder
    func ProductSectionView(_ products: [Product]) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            /// safe check
            if let firstProduct = products.first {
                Text(firstProduct.type.rawValue)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            ForEach(products) { product in
                ProductRowView(product)
            }
        }
        .padding(15.0)
        /// - For auto Scrolling VIA ScrollViewProxy
        .id(products.type)
        .offset("CONTENTVIEW") { rect in
            let minY = rect.minY
            /// when the content reaches its top then updating the current active tab
            if (minY < 30 && -minY < (rect.midY / 2) && activeTab != products.type) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    /// safe check
                    activeTab = (minY < 30 && -minY < (rect.midY / 2) && activeTab != products.type) ? products.type : activeTab
                }
            }
        }
    }
    
    /// product row view
    @ViewBuilder
    func ProductRowView(_ product: Product) -> some View {
        HStack(spacing: 15) {
            Image(systemName: "iphone")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                        .fill(.white)
                }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.title3)
                Text(product.subtitle)
                    .font(.callout)
                    .foregroundColor(.gray)
                Text(product.price)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    
    /// scrollable tabs
    @ViewBuilder
    func ScrollableTabs(_ proxy: ScrollViewProxy) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(ProductType.allCases, id: \.rawValue) { type in
                    Text(type.rawValue)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(content: {
                            if activeTab == type {
                                Capsule()
                                    .fill(.white)
                                    .frame(height: 5)
                                    .padding(.horizontal, -5)
                                    .offset(y: 25)
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        })
                        .padding(.horizontal, 15)
                        .contentShape(Rectangle())
                        /// Scrolling Tab's when ever the active tab is updated
                        .id(type.tapID)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                activeTab = type
                                /// Scrolling to the selected content
                                proxy.scrollTo(type, anchor: .topLeading)
                            }
                        }
                }
            }
            .padding(.vertical, 15)
            .onChange(of: activeTab) { newValue in
                withAnimation(.easeInOut(duration: 0.3)) {
                    proxy.scrollTo(newValue.tapID, anchor: .center)
                }
            }
        }
        .background {
            Rectangle()
                .fill(Color.red)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
