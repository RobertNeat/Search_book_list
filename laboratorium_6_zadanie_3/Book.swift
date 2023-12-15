//  Book.swift
//  laboratorium_6_zadanie_3

import Foundation

struct Book: Hashable{
    var author:(String,String)
    var title:String
    var count:Int
    
    func hash(into hasher: inout Hasher){
        hasher.combine(author.0)
        hasher.combine(author.1)
        hasher.combine(title)
        hasher.combine(count)
    }
    
    static func ==(lhs: Book, rhs: Book) -> Bool {
           return lhs.author == rhs.author &&
               lhs.title == rhs.title &&
               lhs.count == rhs.count
       }
}

let books_declared: [Book] = [
    Book(author: ("Henryk", "Sienkiewicz"), title: "W pustyni i w puszczy", count: 10),
    Book(author: ("Bolesław", "Prus"), title: "Lalka", count: 5),
    Book(author: ("Henryk", "Sienkiewicz"), title: "Quo Vadis", count: 8),
    Book(author: ("Stefan", "Żeromski"), title: "Ludzie bezdomni", count: 15),
    Book(author: ("Władysław", "Reymont"), title: "Chłopi", count: 3),
    Book(author: ("Eliza", "Orzeszkowa"), title: "Nad Niemnem", count: 7),
    Book(author: ("Stanisław", "Lem"), title: "Solaris", count: 2),
    Book(author: ("Maria", "Konopnicka"), title: "Ojczyzna", count: 12),
    Book(author: ("Juliusz", "Słowacki"), title: "Kordian", count: 6),
    Book(author: ("Czesław", "Miłosz"), title: "Zniewolony umysł", count: 4),
    Book(author: ("Jan", "Paweł II"), title: "Krzyż i pień", count: 9),
    Book(author: ("Witold", "Gombrowicz"), title: "Ferdydurke", count: 11),
    Book(author: ("Zbigniew", "Herbert"), title: "Pan Cogito", count: 7),
    Book(author: ("Władysław", "Stanisław Reymont"), title: "Ziemia obiecana", count: 3),
    Book(author: ("Tadeusz", "Dołęga-Mostowicz"), title: "Znachor", count: 5),
    Book(author: ("Stefan", "Grabiński"), title: "Demon ruchu", count: 8),
    Book(author: ("Adam", "Mickiewicz"), title: "Dziady", count: 2),
    Book(author: ("Zofia", "Nałkowska"), title: "Granica", count: 6),
    Book(author: ("Stefan", "Zweig"), title: "Dwadzieścia cztery godziny z życia kobiety", count: 4),
    Book(author: ("Bruno", "Schulz"), title: "Sanatorium pod Klepsydrą", count: 10)
]
