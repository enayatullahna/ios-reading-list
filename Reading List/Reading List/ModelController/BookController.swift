//
//  BookController.swift
//  Reading List
//
//  Created by Enayatullah Naseri on 5/24/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    private(set) var books: [Book] = []
    
    
    var  readingListURL: URL? {
        
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return documents.appendingPathComponent("readingList.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = readingListURL else {
            return
        }
        do {
            
            let encoder = PropertyListEncoder()
            let booksData = try encoder.encode(books)
            try booksData.write(to: url)
            
        } catch {
            NSLog("Error saving to disk: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = readingListURL, fileManager.fileExists(atPath: url.path) else {
            return
        }
        do {
            
            let booksData = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            books = try decoder.decode([Book].self, from: booksData)
            
        } catch {
            NSLog("Error loading from disk: \(error)")
        }
    }
    
    func updateHasBeenRead(for book: Book) {
        guard let index = books.index(of: book) else { return }
        books[index].hasBeenRead = !books[index].hasBeenRead
        //
        //
    }
    
    
    // part 1 section 7
    var readBooks: [Book] {
        let readBookList = books.filter
        return readBookList
    }
    
    // part 1 section 8
    var unreadBooks: [Book] {
        let unreadBookList = books.filter
        return unreadBookList
    }
}
