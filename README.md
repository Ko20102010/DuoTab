DuoTab 💬💸The 3-second shared expense tracker for Gen Z couples & close friends.Minimalist. Privacy-first. Zero awkward money talks. Powered by Apple CloudKit.🌟 Why DuoTab?Traditional expense trackers are either clunky accounting ledgers designed for CPAs or bloated group splitters filled with 10-second countdown ads.DuoTab is purpose-built for how modern couples and Gen Z roommates actually handle money:⚡ 3-Second Entry: Open the app $\rightarrow$ Numpad is already up $\rightarrow$ Tap category $\rightarrow$ Done.🧘 Soft Splitting & Treat Swap: No petty 50/50 bean-counting. Track shared tabs, balance offsets (e.g., "I got the boba, you grab dinner"), and settle up whenever it feels right.🔒 Zero Accounts, Pure Privacy: No email signups, no bank logins, no central server database. Data syncs directly via personal Apple iCloud accounts using CloudKit.🖤 Gen Z Aesthetic: Bento-grid UI, buttery haptic feedback, dark mode by default, and zero corporate stiffness.🎯 Gen Z-Specific Product DesignGen Z Pain PointDuoTab Solution"Talking about money feels awkward and calculative"Vibe Balance Indicator: Replaces harsh "You owe $X" with soft visual indicators (e.g., "Alex is ahead by HK$120 — Taylor gets next meal")."Apps require too many taps just to log a coffee"Instant Numpad & Widget: The keyboard is pinned to the home screen. A lock-screen widget allows 1-tap logging."Tired of ads and high subscriptions"No Ad Model: Zero banner or popup ads. Free tier is genuinely usable."I hate signing up with personal phone/email"iMessage 1-Click Invite: Invite your partner via standard Apple CloudKit share link."We are saving for specific moments, not generic net worth"Shared Vaults: Dedicated mini-ledgers for "Tokyo Trip 🇯🇵", "Concert Weekend 🎟️", or "Apartment Upgrade 🛋️"."Local payment settlement"One-Tap Payment Link: Instant copy of FPS (轉數快) / PayMe / Venmo handle for frictionless repayment.📱 Core User Experience (MVP)┌──────────────────────────────────────┐
│  DuoTab               [🇯🇵 Tokyo Tab] │
├──────────────────────────────────────┤
│          VIBE BALANCE                │
│    ✦ Taylor is ahead by HK$ 180      │
│   [ Settle via PayMe / FPS ]         │
├──────────────────────────────────────┤
│  RECENT ACTIVITY                     │
│  • Match Latte      -HK$ 42  (Alex)  │
│  • Groceries       -HK$ 218  (Taylor)│
│  • Cinema Tickets  -HK$ 160  (Taylor)│
├──────────────────────────────────────┤
│  QUICK LOG                           │
│  [  HK$ 0.00                       ] │
│  ┌─────┬─────┬─────┬──────────────┐  │
│  │  1  │  2  │  3  │ ☕ Coffee    │  │
│  ├─────┼─────┼─────┼──────────────┤  │
│  │  4  │  5  │  6  │ 🍜 Food      │  │
│  ├─────┼─────┼─────┼──────────────┤  │
│  │  7  │  8  │  9  │ 🛒 Grocery   │  │
│  ├─────┼─────┼─────┼──────────────┤  │
│  │  .  │  0  │ ⌫   │ 🍿 Fun       │  │
│  └─────┴─────┴─────┴──────────────┘  │
│    [Toggle: Paid by Me / Partner]    │
└──────────────────────────────────────┘
🛠 Tech StackLanguage: Swift 5.9+Framework: SwiftUI (iOS 17+)Local Persistence & Sync: SwiftData + Apple CloudKit (CKShare for collaborative zones)Haptics: UIImpactFeedbackGeneratorArchitecture: MVVM (Model-View-ViewModel)📂 Repository File StructureDuoTab/
├── README.md
├── LICENSE
├── DuoTab.xcodeproj
└── DuoTab/
    ├── App/
    │   ├── DuoTabApp.swift
    │   └── Configuration.swift
    ├── Models/
    │   ├── Expense.swift
    │   ├── Category.swift
    │   ├── DuoLedger.swift
    │   └── UserProfile.swift
    ├── ViewModels/
    │   ├── LedgerViewModel.swift
    │   └── QuickEntryViewModel.swift
    ├── Views/
    │   ├── Main/
    │   │   ├── HomeView.swift
    │   │   ├── BalanceHeaderView.swift
    │   │   └── RecentActivityListView.swift
    │   ├── Components/
    │   │   ├── NumpadView.swift
    │   │   ├── CategoryPickerView.swift
    │   │   └── SettleModalView.swift
    │   └── Settings/
    │       ├── LedgerSettingsView.swift
    │       └── ShareInviteView.swift
    └── Services/
        ├── CloudKitSyncService.swift
        └── HapticService.swift
💻 Core Codebase Blueprint (Ready to Build)1. Data Models (Models/Expense.swift)import Foundation
import SwiftData

enum SplitMode: String, Codable, CaseIterable {
    case equal = "50/50"
    case treat = "100% Treat"
    case custom = "Custom"
}

enum ExpenseCategory: String, Codable, CaseIterable, Identifiable {
    case food = "Food"
    case coffee = "Coffee"
    case groceries = "Groceries"
    case entertainment = "Fun"
    case transport = "Transport"
    case stay = "Home"

    var id: String { rawValue }

    var icon: String {
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
final class Expense {
    @Attribute(.unique) var id: UUID
    var title: String
    var amount: Double
    var date: Date
    var category: ExpenseCategory
    var paidByUserId: String
    var splitMode: SplitMode
    var notes: String?

    init(
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
2. View Model & Soft Settlement Logic (ViewModels/LedgerViewModel.swift)import Foundation
import SwiftUI

@Observable
final class LedgerViewModel {
    var expenses: [Expense] = []
    var currentUserId: String = "User_Alex"
    var partnerId: String = "User_Taylor"
    var partnerName: String = "Taylor"

    /// Calculates net balance between partners.
    /// Positive: Partner owes current user.
    /// Negative: Current user owes partner.
    var netBalance: Double {
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

    var balanceStatusText: String {
        if abs(netBalance) < 1.0 {
            return "All settled up ✨"
        } else if netBalance > 0 {
            return "\(partnerName) owes you HK$ \(String(format: "%.1f", netBalance))"
        } else {
            return "You owe \(partnerName) HK$ \(String(format: "%.1f", abs(netBalance)))"
        }
    }

    func addExpense(amount: Double, category: ExpenseCategory, paidByMe: Bool) {
        let newExpense = Expense(
            amount: amount,
            category: category,
            paidByUserId: paidByMe ? currentUserId : partnerId,
            splitMode: .equal
        )
        expenses.insert(newExpense, at: 0)
        HapticService.shared.success()
    }
}
3. SwiftUI Numpad & Quick Entry (Views/Components/NumpadView.swift)import SwiftUI

struct NumpadView: View {
    @Binding var amountString: String
    var onCategorySelected: (ExpenseCategory) -> Void

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 8) {
            // Display Amount
            Text("HK$ " + (amountString.isEmpty ? "0" : amountString))
                .font(.system(size: 38, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)

            // Numpad + Quick Category Matrix
            LazyVGrid(columns: columns, spacing: 8) {
                numKey("1"); numKey("2"); numKey("3"); categoryKey(.food)
                numKey("4"); numKey("5"); numKey("6"); categoryKey(.coffee)
                numKey("7"); numKey("8"); numKey("9"); categoryKey(.groceries)
                actionKey("."); numKey("0"); deleteKey(); categoryKey(.entertainment)
            }
            .padding(.horizontal, 16)
        }
    }

    private func numKey(_ digit: String) -> some View {
        Button(action: {
            HapticService.shared.light()
            if amountString == "0" { amountString = digit }
            else { amountString.append(digit) }
        }) {
            Text(digit)
                .font(.title2.weight(.medium))
                .frame(maxWidth: .infinity, minHeight: 52)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }

    private func categoryKey(_ cat: ExpenseCategory) -> some View {
        Button(action: {
            guard let val = Double(amountString), val > 0 else { return }
            onCategorySelected(cat)
            amountString = ""
        }) {
            VStack(spacing: 2) {
                Image(systemName: cat.icon)
                    .font(.headline)
                Text(cat.rawValue)
                    .font(.caption2.weight(.semibold))
            }
            .frame(maxWidth: .infinity, minHeight: 52)
            .background(Color.accentColor.opacity(0.15))
            .foregroundColor(.accentColor)
            .cornerRadius(12)
        }
    }

    private func actionKey(_ char: String) -> some View {
        Button(action: {
            if !amountString.contains(char) {
                amountString.append(char.isEmpty ? "0." : char)
            }
        }) {
            Text(char)
                .font(.title2.weight(.medium))
                .frame(maxWidth: .infinity, minHeight: 52)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
        }
    }

    private func deleteKey() -> some View {
        Button(action: {
            HapticService.shared.light()
            if !amountString.isEmpty { amountString.removeLast() }
        }) {
            Image(systemName: "delete.left.fill")
                .frame(maxWidth: .infinity, minHeight: 52)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
        }
    }
}
💎 Monetization & Business ModelDuoTab runs on a "Dual-Pass Pro" model:Free Tier: 1 Shared Ledger, 100% ad-free, full iCloud real-time sync, basic monthly split summary.DuoTab Pro (HK$ 18/month, HK$ 98/year, or HK$ 128 Lifetime):Buy once, unlock for both: When one partner purchases Pro, the connected partner unlocks all Pro features automatically.Unlimited Shared Vaults (Travel, Move-in, Pets, Gifts).iOS Lock Screen & Desktop Interactive Widgets.Custom category creation & emoji customization.CSV/PDF Statement export.🚀 Getting StartedClone the repo:git clone https://github.com/your-username/DuoTab.git
Open in Xcode:
Open DuoTab.xcodeproj on a Mac running macOS Sonoma or later with Xcode 15+.Configure iCloud:
In project settings under Signing & Capabilities, add the iCloud capability and check CloudKit.Run: Select your target iPhone or iOS Simulator and press Cmd + R.📄 LicenseReleased under the MIT License.
