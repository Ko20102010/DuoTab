import Foundation
import SwiftData

public enum SplitMode: String, Codable, CaseIterable {
    case equal = "50/50"
    case treat = "100% Treat"
    case custom = "Custom"
}

public enum ExpenseCategory: String, Codable, CaseIterable, Identifiable {
    case food = "Food"
    case coffee = "Coffee"
    case groceries = "Groceries"
    case entertainment = "Fun"
    case transport = "Transport"
    case stay = "Home"

    public var id: String { rawValue }

    public var icon: String {
        switch self {
        case .food: return "fork.knife"
        case .coffee: return "cup.and.saucer.fill"
        case .groceries: return "cart.fill"
        case .entertainment: return "popcorn.fill"
        case .transport: return "tram.fill"
        case .stay: return "house.fill"
        }
    }
}

@Model
public final class Expense {
    @Attribute(.unique) public var id: UUID
    public var title: String
    public var amount: Double
    public var date: Date
    public var category: ExpenseCategory
    public var paidByUserId: String
    public var splitMode: SplitMode
    public var notes: String?

    public init(
        id: UUID = UUID(),
        title: String = "",
        amount: Double,
        date: Date = Date(),
        category: ExpenseCategory,
        paidByUserId: String,
        splitMode: SplitMode = .equal,
        notes: String? = nil
    ) {
        self.id = id
        self.title = title
        self.amount = amount
        self.date = date
        self.category = category
        self.paidByUserId = paidByUserId
        self.splitMode = splitMode
        self.notes = notes
    }
}
