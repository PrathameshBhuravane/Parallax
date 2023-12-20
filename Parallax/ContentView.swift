//
//  ContentView.swift
//  Parallax
//
//  Created by Prathamesh on 19/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //        ScrollView(.vertical){
        VStack {
            GeometryReader(content: { geometry in
                let size = geometry.size
                ScrollView(.horizontal){
                    HStack(spacing: 5){
                        ForEach(tripCards){ card in
                            GeometryReader(content: { proxy in
                                let cardSize = proxy.size
                                //                                    let minX = proxy.frame(in: .scrollView).minX
                                let minX = min(proxy.frame(in: .scrollView).minX * 1.4, proxy.size.width * 1.4)
                                Image(card.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .scaleEffect(1.25)
                                    .offset(x: -minX)
                                //                                        .frame(width: proxy.size.width * 2.5)
                                    .frame(width: cardSize.width,height: cardSize.height)
                                    .overlay {
                                        OverlayView(card: card)
                                    }
                                    .clipShape(.rect(cornerRadius: 15))
                                    .shadow(color: .black.opacity(0.25),radius: 8,x: 5, y:10)
                                
                            })
                            .frame(width: size.width - 60,height: size.height - 50)
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                view.scaleEffect(phase.isIdentity ? 1: 0.95)
                            }
                        }
                        
                    }.padding(.horizontal,30)
                        .scrollTargetLayout()
                        .frame(height: size.height,alignment: .top)
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
            })
            .frame(height: 500)
            .padding(.horizontal,-15)
            .padding(.top, 10)
        }
        .padding(15)
        //        }
        //        .scrollIndicators(.hidden)
    }
    
    
    @ViewBuilder
    func OverlayView(card: TripCard) -> some View {
        ZStack(alignment:
                .bottomLeading, content: {
                    LinearGradient (colors: [
                        .clear,
                        .clear,
                        .clear,
                        .clear,
                        .clear,
                        .black.opacity(0.1),
                        .black.opacity (0.5),
                        .black],
                                    startPoint: .top, endPoint: .bottom)
                    VStack(alignment: .leading, spacing: 4,content:{
                        Text (card.title)
                            .font(.title2)
                            .fontWeight(.black)
                            .foregroundStyle(.white)
                        Text (card.subTitle)
                            .font(.callout)
                            .foregroundStyle(.white.opacity(0.8))
                    })
                    .padding(20)
                })
    }
}

#Preview {
    ContentView()
}
