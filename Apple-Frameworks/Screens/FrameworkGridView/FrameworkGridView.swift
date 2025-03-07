//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by Andrew Chong on 2/25/25.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel() 
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(value: framework) {
                            FrameworkTitleView(framework: framework)
                        }
                
                    }
                    
                    
                }
            }
            .navigationTitle("🍎 Frameworks")
            .navigationDestination(for: Framework.self) {
                framework in FrameworkDetailView(framework: framework)
            }

        }
      
        
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}


