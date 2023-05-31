//
//  NameInputView.swift
//  Affirmation
//
//  Created by James Wolfe on 13/05/2023.
//

import SwiftUI

struct NameInputView: View {
    
    // MARK: - Variables
    @StateObject var viewModel = NameInputViewModel()
    @FocusState var focused: Bool
    
    // MARK: - Views
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 5) {
                Spacer()
                Text("NameInputView.PromptLabel.Text".localized)
                    .foregroundColor(.accentColor)
                    .font(.baskerville(.bold, size: 34))
                TextField.init("_", text: $viewModel.name)
                    .foregroundColor(.accentColor)
                    .font(.baskerville(.bold, size: 34))
                    .focused($focused)
                    .submitLabel(.done)
                    .textContentType(.name)
                    .onSubmit(viewModel.submit)
                Spacer()
            }
            Spacer()
        }.padding()
        .onAppear {
            focused = true
        }
    }
    
}

struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NameInputView()
    }
}
