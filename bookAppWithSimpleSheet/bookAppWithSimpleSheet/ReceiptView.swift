//
//  ReceiptView.swift
//  bookAppWithSimpleSheet
//
//  Created by Peter Deyi on 5/2/23.
//

import SwiftUI

struct ReceiptView: View {
    @EnvironmentObject var appData: ApplicationData
    
    var body: some View {
        VStack {
            List(appData.bookOrderData.bookItemOrders){ orderItem in
                HStack(alignment: .top) {
                    Image(orderItem.bookItem.cover)
                        .resizable()
                        .frame(width: 80, height: 100)
                        .scaledToFill()
                    VStack(alignment: .leading, spacing: 2) {
                        Text(orderItem.bookItem.title)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                        Text("$\(orderItem.bookItem.price.formatted()) x \(orderItem.unit)")
                        Text("Amount: \((orderItem.bookItem.price * Double(orderItem.unit)).formatted())")
                    }.padding(.top, 5)
                }//end of HStack
            }//end of list
            Text("Total Payment: \(appData.bookOrderData.formattedTotalCost)")
            Spacer()
            Button {
                //add payment Action here
            } label: {
                Text("Apple Pay")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}



struct ReceiptView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptView()
    }
}

