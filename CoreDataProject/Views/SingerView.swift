//
//  SingerView.swift
//  CoreDataProject
//
//  Created by Baptiste Cadoux on 18/11/2021.
//

import SwiftUI

struct SingerView: View {
    @Environment(\.managedObjectContext) private var moc
    @State var lastNameFilter = "A"

    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName",
                         filterValue: lastNameFilter,
                         predicateType: .beginsWith,
                         sortDescriptors: []) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }

            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? self.moc.save()
            }

            Button("Show A") {
                self.lastNameFilter = "A"
            }

            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
    }
}

struct SingerView_Previews: PreviewProvider {
    static var previews: some View {
        SingerView()
    }
}
