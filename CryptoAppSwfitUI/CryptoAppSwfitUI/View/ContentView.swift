//
//  ContentView.swift
//  CryptoAppSwfitUI
//
//  Created by Berkay Sazak on 27.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cryptoListViewModel: CryptoListViewModel
    
    init(){
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationStack{
                List(cryptoListViewModel.cryptoList, id: \.id){ crypto in
                    NavigationLink(destination: DetailsView(crypto: crypto)) {
                        HStack {
                            Text(crypto.currency)
                                .font(.title3)
                                .foregroundStyle(.black)
                                .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            Text(crypto.price)
                                .font(.custom("", size: 18))
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                 
                }.navigationTitle("Crpyto SwiftUI")
        }.onAppear(perform: {
            cryptoListViewModel.downloadCrypto(url: URL(string : "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        })
        }
}


#Preview {
    ContentView()
}
