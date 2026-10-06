# DuoTab 💬💸
> **The 3-second multi-group shared expense tracker, couple PnL & smart KPI analytics manager.**  
> Minimalist. Privacy-first. Zero awkward money talks. Powered by Firebase Realtime Database & PWA.

[![Version](https://img.shields.io/badge/version-v1.6.1-blue.svg)](https://github.com/Ko20102010/DuoTab)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-iOS%20PWA%20%7C%20SwiftUI-orange.svg)](https://developer.apple.com/)

---

**Version:** v1.6.1  
**Release date:** 6 October 2026  

---

## v1.6.1 Release Notes

### New
- **Wants vs. Needs Ratio Analysis (想要 vs. 必要 開銷體質分析):**
  - Integrated 50/30/20 financial rule analytics inside the KPI Report.
  - Automatically classifies expenditures into **必要剛需 (Needs)** (groceries, utilities, transit, medical) vs. **犒賞享樂 (Wants)** (dining, drinks, leisure, shopping).
  - Displays dual-color balance bar to help couples identify saving opportunities without judgment.
- **Boba & Coffee Frequency Index (高頻小額手搖咖啡指數):**
  - Tracks monthly frequency count and total HKD spent on micro-pleasures (boba tea & coffee).
  - Pinpoints stealth expenses that drain monthly savings over time.

---

## v1.6.0 Release Notes

### New
- **The "90/10" Architecture & Dedicated Advanced Hub (📊 報表與進階中心):**
  - Completely decluttered the main interface to preserve 100% of the 3-second fast logging flow for 90% of daily operations.
  - Consolidated all secondary, complex, and configuration workflows into a dedicated **Advanced Hub Modal** accessed via a single top-right `📊` button.
- **Financial KPI Dashboard & Analytics (KPI 財務月報系統):**
  - Aggregates joint Total Income, Total Expenses, Net Monthly Savings, Savings Rate (%), Daily Average Expenditure, and Transaction Volume.
- **1-Click Spreadsheet & Text Export (報表雙軌匯出):**
  - **📥 Export CSV/Excel:** Generates standard `.csv` spreadsheets encoded with UTF-8 BOM, ensuring clean opening in Microsoft Excel and Numbers on iOS/Mac without garbled Chinese text.
  - **📋 Copy Formatted Text Summary:** Formats structured monthly financial summaries ready to paste directly into WhatsApp, Telegram, or Notion.
- **Unified Advanced Storage Drawer (進階收納專區):**
  - Houses Recurring Automation, Cloud Sync Room Code, Member Manager, Monthly Budget Tuning, and All-Category Drawer.

---

## v1.5.0 Release Notes

### New
- **In-Place Record Editing Modal:** Tap any transaction in the activity list to directly edit amount, category, payer, or payment method.
- **Automated Recurring Engine:** Supports scheduled automatic fixed salary entries and payday prompt modals for sales commissions and bonuses.

---

## v1.4.1 Release Notes

### New
- **Comprehensive Category Drawer:** Dedicated `🏷️ 全部分類/補記` modal for nighttime catch-up logging.
- **Payment Method Tagging:** Dedicated payment selector chips (`💳 信用卡`, `💵 現金`, `🐙 八達通`, `📱 FPS/PayMe`) with sticky memory.

---

## v1.4.0 Release Notes

### New
- **Smart Time-Based Category Prediction:** Keypad automatically highlights and prioritizes the 4 most probable categories matching current clock time.
- **Monthly Budget Pace & Daily Allowance:** Dynamic budget progress bar with real-time daily remaining budget calculations.
- **Celebrations & Habit Streak:** Confetti burst animation upon debt clearance and consecutive days logging tracker (`🔥 X天連記`).

---

## v1.3.0 Release Notes

### New
- **Firebase Realtime Database Live Sync:** Sub-second bi-directional live sync across multiple iPhones.
- **Anti-Collision PIN Security:** Added secret room PIN protection and 1-tap high-entropy random room code generation.

---

## v1.2.0 Release Notes

### New
- **Multi-Sheet Workspace Support:** Completely isolated ledgers (e.g. "🏡 家庭情侶" vs "🍜 同事午餐").
- **Dynamic Per-Expense Participant Toggling:** Supports dining dropouts and partial member splits.

---

## v1.1.0 Release Notes

### New
- **Dual-Mode Dashboard:** Switcher between 50/50 balance settlement and household PnL / savings rate tracking.
- **Income & Expense Classification:** Instant toggle between `支出 (-)` and `收入 (+)`.

---

## v1.0.0 Release Notes

### New
- **Instant 3-Second Numpad Entry:** Pinned numeric keypad with one-tap category shortcuts.
- **Progressive Web App (PWA) Manifest:** Added `manifest.json` and standalone iOS configuration.

---

## 🛠 Architecture & Tech Stack

- **Web / PWA Version:** Semantic HTML5, CSS3 Custom Properties, Vanilla JavaScript (ES6+), Firebase Realtime Database SDK, Web Manifest, Service Worker.
- **iOS Native Version:** Swift 5.9+, SwiftUI 5.0, SwiftData, Apple CloudKit (`CKShare`).
- **Platform Compatibility:** iOS Safari (PWA Standalone), macOS, Chrome, and all modern mobile browsers.
- **Data Privacy:** 100% Client-side + Room-scoped PIN-encrypted database paths.

---

## 📋 Versioning Policy

- **Major function (vX.0.0):** Architectural overhauls, backend sync protocol shifts, major multi-currency engines.
- **Minor function (v0.X.0):** New categories, custom themes, export formats (CSV/Excel), or widget additions.
- **Bug-fix-only (v0.0.X):** Visual polish, alignment adjustments, touch-target refinements, and calculation fixes.
- *Release notes are cumulative; newest release remains at the top and previous releases are retained.*

---

## 📄 License
Released under the [MIT License](LICENSE).
