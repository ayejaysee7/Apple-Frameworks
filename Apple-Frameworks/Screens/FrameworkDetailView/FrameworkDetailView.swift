//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Andrew Chong on 2/27/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
                
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
//            .foregroundColor(.yellow )
//            .buttonBorderShape(.roundedRectangle(radius: 20))
            .tint(.red)
            .fullScreenCover(isPresented: $isShowingSafariView, content: { SafariView(url: URL(string: framework.urlString) ?? URL(string: "https://www.apple.com")!)
            })
        }
    }
}
    
    #Preview {
        FrameworkDetailView(framework:
                                MockData.sampleFramework, isShowingDetailView: .constant(false)).preferredColorScheme(.dark)
    }

