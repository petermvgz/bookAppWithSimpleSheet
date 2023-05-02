//
//  ContentView.swift
//  bookAppWithSimpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: ApplicationData
    @State private var showSheet = false
    var body: some View {
        NavigationStack {
            List(appData.appData) { book in
                NavigationLink {
                    DetailView(bookItem: book)
                } label: {
                    HStack(alignment: .top) {
                        Image(book.cover)
                            .resizable()
                            .frame(width: 80, height: 100)
                            .scaledToFit()
                        VStack(alignment: .leading, spacing: 2.0) {
                            Text(book.title)
                                .fontWeight(.bold)
                            Text(book.author)
                            Text("\(String(book.year))")
                                .font(.caption)
                            Text("$\(book.price.formatted())")
                                .font(.caption)
                            Spacer()
                        }.padding(.top, 5)
                        Spacer()
                    }
                }

                
            }
            .listStyle(.inset)
            .navigationTitle("Book List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .sheet(isPresented: $showSheet) {
                AddBookView()
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ApplicationData())
    }
}
