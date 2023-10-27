//
//  DetailsView.swift
//  CryptoAppSwfitUI
//
//  Created by Berkay Sazak on 27.10.2023.
//

import SwiftUI

struct DetailsView: View {
    
    var crypto : CryptoViewModel
    
  
   
    var body: some View {
        NavigationStack{
            VStack{
                Text(crypto.currency)
                
                Text(crypto.price)
            }
        }
      

    }
}

#Preview {
    DetailsView(crypto: CryptoViewModel(crypto: Crypto(currency: "Bitcoin", price: "54k")))
}
