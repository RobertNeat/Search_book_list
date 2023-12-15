//  SearchView.swift
//  laboratorium_6_zadanie_3

import SwiftUI

struct SearchView: View {
    
    @Binding var books:[Book]
    @Binding var search_result:[Book]
    
    @State var name:String = ""
    @State var surname:String = ""
    @State var title:String = ""
    
    @State private var showAlert = false//informacja o ilości wyszukań
    
    var body: some View {
        VStack{
            Spacer()
            List{
                Section(header: Text("Search form:")){
                    
                    HStack{
                        Text("Name:").foregroundColor(.gray)
                        TextField("...", text: $name)
                    }
                    
                    HStack{
                        Text("Surname:").foregroundColor(.gray)
                        TextField("...", text: $surname)
                    }
                    
                    HStack{
                        Text("Title:").foregroundColor(.gray)
                        TextField("...", text: $title)
                    }
                    
                }
                
                
                //search button
                Button( action:{
                    self.search_result.removeAll()
                    
                    for book in books{
                        
                        if(
                            (name.isEmpty || book.author.0.lowercased().contains(name.lowercased()))
                            && (surname.isEmpty || book.author.1.lowercased().contains(surname.lowercased()))
                            && (title.isEmpty || book.title.lowercased().contains(title.lowercased()))
                            ){
                            search_result.append(book)//self.
                        }
                         
                    }
                    
                    //wyświetlenie powiadomienia z ilością wyszukań
                    showAlert=true
                    
                    
                }){
                    HStack(){
                        Spacer()
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                        Spacer()
                    }
                }
                
                
            }
            

            
            
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Search result"), message: Text("Found \(search_result.count) results"), dismissButton: .default(Text("OK")))
            })
            
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(books: .constant([]),search_result: .constant([]))
    }
}
