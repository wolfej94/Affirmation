//
//  AffirmationStackView.swift
//  Affirmation
//
//  Created by James Wolfe on 13/05/2023.
//

import SwiftUI

struct AffirmationStackView: View {
    
    // MARK: - Variables
    @StateObject var viewModel: AffirmationStackViewModel
    @Namespace var animation
    
    // MARK: - Initializers
    init(name: String) {
        _viewModel = .init(wrappedValue: .init(name: name))
    }
    
    // MARK: - Views
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.selectedAffirmation == nil {
                HStack {
                    Text(viewModel.greeting)
                        .foregroundColor(.text)
                        .font(.baskerville(.semibold, size: 34))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
            ZStack {
                ForEach(viewModel.affirmations) { affirmation in
                    if viewModel.selectedAffirmation == affirmation {
                        Color.white
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .ignoresSafeArea()
                            .matchedGeometryEffect(id: "\(viewModel.selectedAffirmation!)_background", in: animation)
                    }
                    if viewModel.selectedAffirmation == nil || viewModel.selectedAffirmation == affirmation {
                        card(forAffirmation: affirmation)
                    }
                }
            }
        }
    }
    
    @ViewBuilder func card(forAffirmation affirmation: String) -> some View {
        ZStack {
            if viewModel.selectedAffirmation != affirmation {
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: viewModel.selectedAffirmation == nil ? 10 : 0))
                    .shadow(radius: viewModel.selectedAffirmation == nil ? 5 : 0)
                    .matchedGeometryEffect(id: "\(affirmation)_background", in: animation)
            }
            VStack {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(affirmation)
                            .foregroundColor(.accentColor)
                            .font(.baskerville(.bold, size: 34))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        if viewModel.selectedAffirmation != nil {
                            Button(action: viewModel.share, label: {
                                Image.share
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 40))
                            })
                            .transition(.scale)
                            Button(action: viewModel.favourite, label: {
                                (viewModel.isFavourited ? Image.heartFill : Image.heart)
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 40))
                            })
                            .transition(.scale)
                        } else {
                            Button(action: viewModel.selectAffirmation, label: {
                                Image.context
                                    .foregroundColor(.accentColor)
                                    .font(.system(size: 40))
                            })
                            .transition(.opacity)
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .padding(.all, viewModel.selectedAffirmation == nil ? 20 : 0)
        .offset(affirmation == viewModel.affirmations.last ? viewModel.topCardOffset : .zero)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    if viewModel.selectedAffirmation == nil && affirmation == viewModel.affirmations.last {
                        viewModel.topCardOffset = gesture.translation
                    }
                }
                .onEnded { _ in
                    if viewModel.selectedAffirmation == nil && affirmation == viewModel.affirmations.last {
                        if abs(viewModel.topCardOffset.width) > 100 {
                            viewModel.affirmations.removeAll(where: { $0 == affirmation })
                            viewModel.topCardOffset = .zero
                        } else {
                            viewModel.topCardOffset = .zero
                        }
                    }
                }
        )
    }
}

struct AffirmationStackView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationStackView(name: "James Wolfe")
    }
}
