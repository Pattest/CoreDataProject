//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Baptiste Cadoux on 18/11/2021.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(filterKey: String,
         filterValue: String,
         predicateType: PredicateType,
         sortDescriptors: [NSSortDescriptor],
         @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(
            entity: T.entity(),
            sortDescriptors: sortDescriptors,
            predicate: NSPredicate(format: "%K \(predicateType.rawValue) %@",
                                   filterKey,
                                   filterValue))
        self.content = content
    }
}
