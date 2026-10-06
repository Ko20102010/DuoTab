import Foundation
import SwiftUI

@Observable
public final class LedgerViewModel {
    public var expenses: [Expense] = []
    public var currentUserId: String = "User_Alex"
    public var partnerId: String = "User_Taylor"
    public var partnerName: String = "Taylor"

    public init() {}

    public var netBalance: Double {
        var balance: Double = 0.0
        for item in expenses {
            guard item.splitMode == .equal else { continue }
            let half = item.amount / 2.0
            if item.paidByUserId == currentUserId {
                balance += half
            } else {
                balance -= half
            }
        }
        return balance
    }

    public var balanceStatusText: String {
        if abs(netBalance) < 1.0 {
            return "All settled up ✨"
        } else if netBalance > 0 {
            return "\(partnerName) owes you HK$ \(String(format: "%.1f", netBalance))"
        } else {
            return "You owe \(partnerName) HK$ \(String(format: "%.1f", abs(netBalance)))"
        }
    }

    public func addExpense(amount: Double, category: ExpenseCategory, paidByMe: Bool) {
        let newExpense = Expense(
            amount: amount,
            category: category,
            paidByUserId: paidByMe ? currentUserId : partnerId,
            splitMode: .equal
        )
        expenses.insert(newExpense, at: 0)
    }
}
