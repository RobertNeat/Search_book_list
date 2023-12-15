//  ContentView.swift
//  laboratorium_6_zadanie_3

import SwiftUI

struct ContentView: View {
    @State var books = books_declared
    @State var search_result:[Book] = []
    
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Searched items:")
                    .font(.system(size:20,weight: .semibold))
                    .foregroundColor(.gray)
                
                List{
                    
                    ForEach(search_result,id: \.self){ book in
                            
                            //element wyszukiwany
                            Section(header: Text("")){
                                
                                HStack{
                                    Text("Author:").foregroundColor(.gray)
                                    Text("\(book.author.0) \(book.author.1)")
                                }
                                HStack{
                                    Text("Title:").foregroundColor(.gray)
                                    Text("\(book.title)")
                                }
                                HStack{
                                    Text("Count:").foregroundColor(.gray)
                                    Text("\(book.count)")
                                }
                                
                            }
                            
                        }
                    
                    
                
                }
                
                //przycisk wyszukiwania
                NavigationLink(destination: SearchView(books:$books,search_result:$search_result)) {
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search book resources")
                        .font(.system(size:20,weight: .regular))
                    }            
                }.buttonStyle(BorderedButtonStyle())
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
 Image(systemName: "magnifyingglass")
     .imageScale(.large)
     .foregroundColor(.accentColor)
 */
