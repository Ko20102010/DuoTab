import SwiftUI
import SwiftData

@main
struct DuoTabApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Expense.self)
    }
}
