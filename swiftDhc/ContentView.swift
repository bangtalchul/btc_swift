//
//  ContentView.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/18.
//

import SwiftUI
import CoreData
import Firebase
import GoogleSignIn

struct ContentView: View {
    @AppStorage("log_status") var logStatus: Bool = false
    @AppStorage("user_name") var userName: String = ""
    
//    @State var isActive : Bool = false

    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    //    var body: some View {
    //        NavigationView {
    //            List {
    //                ForEach(items) { item in
    //                    NavigationLink {
    //                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
    //                    } label: {
    //                        Text(item.timestamp!, formatter: itemFormatter)
    //                    }
    //                }
    //                .onDelete(perform: deleteItems)
    //            }
    //            .toolbar {
    //                ToolbarItem(placement: .navigationBarTrailing) {
    //                    EditButton()
    //                }
    //                ToolbarItem {
    //                    Button(action: addItem) {
    //                        Label("Add Item", systemImage: "plus")
    //                    }
    //                }
    //            }
    //            Text("Select an item")
    //        }
    //    }
    
    // 220822 정희 테스트
    var body: some View {
        if logStatus{
            DemoHome()
        }else{
            Login()
        }
    }
    
    @ViewBuilder
    func DemoHome()->some View{
                TabView {
                    VStack{
                        MainView()
                    }
                    .tabItem {
                        Image(systemName: "house")
                        Text("home")
                    }
        
                    VStack{
                        SearchView()
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("search")
        
                    }
                    VStack{
                        CommunityView()
        //                Text("The Last Tab")
                    }
                    .tabItem {
                        Image(systemName: "message")
                        Text("community")
        
                    }
                    VStack{
                        MyPageView()
                    }
                    .tabItem {
                        Image(systemName: "person")
                        Text("mypage")
                    }
                    //            .badge(10)
        
                }
                .font(.headline)
                .accentColor(Color(red: 85/255, green: 32/255, blue: 132/255))
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
