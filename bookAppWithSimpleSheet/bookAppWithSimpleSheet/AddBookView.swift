//
//  AddBookView.swift
//  bookAppWithSimpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import SwiftUI

struct AddBookView: View {
    @EnvironmentObject var appData: ApplicationData
    @Environment(\.dismiss) var dismiss
    @State private var titleInput: String = ""
    @State private var authorInput: String = ""
    @State private var yearInput: String = ""
    @State private var priceInput: String = ""

    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            HStack {
                //Spacer()
                Button("Close") {
                    dismiss()
                }.padding()
            }
            TextField("Insert Title", text: $titleInput)
                .textFieldStyle(.roundedBorder)
            TextField("Insert Author", text: $authorInput)
                .textFieldStyle(.roundedBorder)
            TextField("Insert Year", text: $yearInput)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
            TextField("Insert Price", text: $priceInput)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
            Button("Save") {
                appData.appendBook(titleInput: titleInput, authorInput: authorInput, yearInput: yearInput, priceInput: priceInput)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
