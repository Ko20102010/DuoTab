import SwiftUI

public struct HomeView: View {
    @State private var viewModel = LedgerViewModel()
    @State private var amountString: String = ""
    @State private var paidByMe: Bool = true

    public init() {}

    public var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Balance Header Card
                VStack(spacing: 8) {
                    Text("VIBE BALANCE")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                    Text(viewModel.balanceStatusText)
                        .font(.title2.weight(.bold))
                        .foregroundStyle(viewModel.netBalance >= 0 ? .green : .orange)

                    Button(action: {
                        // Settle action (copy FPS/PayMe)
                    }) {
                        Label("Settle via PayMe / FPS", systemImage: "arrow.left.arrow.right")
                            .font(.caption.weight(.medium))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.accentColor.opacity(0.12))
                            .clipShape(Capsule())
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
                .padding(.horizontal)

                // Recent Expenses List
                List {
                    Section("Recent Activity") {
                        if viewModel.expenses.isEmpty {
                            Text("No expenses yet. Log your first one below!")
                                .font(.footnote)
                                .foregroundStyle(.secondary)
                        } else {
                            ForEach(viewModel.expenses) { expense in
                                HStack {
                                    Image(systemName: expense.category.icon)
                                        .frame(width: 32, height: 32)
                                        .background(Color.accentColor.opacity(0.1))
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text(expense.category.rawValue)
                                            .font(.subheadline.weight(.semibold))
                                        Text(expense.paidByUserId == viewModel.currentUserId ? "Paid by You" : "Paid by \(viewModel.partnerName)")
                                            .font(.caption2)
                                            .foregroundStyle(.secondary)
                                    }
                                    Spacer()
                                    Text("-HK$ \(String(format: "%.1f", expense.amount))")
                                        .font(.subheadline.weight(.bold))
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)

                // Payer toggle
                Picker("Payer", selection: ) {
                    Text("Paid by Me").tag(true)
                    Text("Paid by \(viewModel.partnerName)").tag(false)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                // Quick Numpad View
                NumpadComponentView(amountString: ) { category in
                    if let val = Double(amountString), val > 0 {
                        viewModel.addExpense(amount: val, category: category, paidByMe: paidByMe)
                        amountString = ""
                    }
                }
            }
            .navigationTitle("DuoTab")
        }
    }
}

struct NumpadComponentView: View {
    @Binding var amountString: String
    var onSelectCategory: (ExpenseCategory) -> Void

    let columns = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 6) {
            Text("HK$ " + (amountString.isEmpty ? "0" : amountString))
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 24)

            LazyVGrid(columns: columns, spacing: 6) {
                btn("1"); btn("2"); btn("3"); catBtn(.food)
                btn("4"); btn("5"); btn("6"); catBtn(.coffee)
                btn("7"); btn("8"); btn("9"); catBtn(.groceries)
                btn("."); btn("0"); delBtn(); catBtn(.entertainment)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 8)
        }
    }

    private func btn(_ text: String) -> some View {
        Button(action: {
            if amountString == "0" { amountString = text }
            else { amountString.append(text) }
        }) {
            Text(text)
                .font(.title3.weight(.medium))
                .frame(maxWidth: .infinity, minHeight: 46)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
        }
        .buttonStyle(.plain)
    }

    private func catBtn(_ cat: ExpenseCategory) -> some View {
        Button(action: { onSelectCategory(cat) }) {
            VStack(spacing: 2) {
                Image(systemName: cat.icon)
                Text(cat.rawValue).font(.system(size: 10, weight: .bold))
            }
            .frame(maxWidth: .infinity, minHeight: 46)
            .background(Color.accentColor.opacity(0.15))
            .foregroundStyle(Color.accentColor)
            .cornerRadius(10)
        }
    }

    private func delBtn() -> some View {
        Button(action: {
            if !amountString.isEmpty { amountString.removeLast() }
        }) {
            Image(systemName: "delete.left.fill")
                .frame(maxWidth: .infinity, minHeight: 46)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
        }
    }
}
