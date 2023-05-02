//
//  DetailView.swift
//  bookAppWithSimpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var appData: ApplicationData
    @State var bookItem: BookModel
    @State private var path = NavigationPath()
    @State private var unitStr = "1"
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{
                Text(bookItem.title)
                    .font(.title)
                Text(bookItem.author)
                Image(bookItem.cover)
                    .resizable()
                    .frame(width: 240, height: 300)
                    .scaledToFill()
                   
                //create text field to capture quantity
                HStack{
                    Text("Quantity: ")
                        .padding(.trailing, 10)
                    TextField("1", text: $unitStr)
                }
                .padding(.leading, 40)
                .padding()
                //navigation button
                Spacer()
                Button {
                    //turn unitStr to unit
                    let unit = Int(unitStr)!
                    //create the food item order
                    let bookItemOrder = BookItemOrder(bookItem: bookItem, unit: unit)
                    //append
                    appData.bookOrderData.appendBookItemOrder(bookItemOrder: bookItemOrder)
                    path.append("ReceiptView")
                    for each in appData.bookOrderData.bookItemOrders {
                        print(each.describeBookItemOrder())
                    }
                    
                } label: {
                    Text("Order This Book")
                }
                .buttonStyle(.borderedProminent)
                .navigationDestination(for: String.self) { view in
                    if view == "ReceiptView" {
                        ReceiptView()
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Details")
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(bookItem: ApplicationData().appData[0])
    }
}

