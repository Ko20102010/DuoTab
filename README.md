DuoTab 💬💸

The 3-second shared expense tracker for Gen Z couples & close friends.

Minimalist. Privacy-first. Zero awkward money talks. Powered by Apple CloudKit & PWA.

Version: v1.0.0

Release date: 6 October 2026

v1.0.0 Release Notes

New

Instant 3-Second Numpad Entry: Pinned numeric keypad on the home screen with one-tap category shortcuts (Dinner 🍜, Drinks ☕, Groceries 🛒, Fun 🍿).

Vibe Balance Indicator: Replaced harsh debt terminology with soft, non-awkward balance status (e.g., "Alex is ahead by HK$120 — Taylor treats next").

Gen Z Dark Mode & Bento Grid: Native dark palette (#0f1015) with high-contrast pastel accents and rounded cards.

One-Tap Settle Up: Integrated one-touch clipboard export for Hong Kong Fast Payment System (FPS / 轉數快) and PayMe payment memos.

Dual-Payer Toggle: Instant switch between "Paid by Me" and "Paid by Partner" without opening sub-menus.

Progressive Web App (PWA) Manifest: Added manifest.json and standalone iOS configuration (apple-mobile-web-app-capable) for borderless home screen launch.

Offline Cache Service Worker: Integrated sw.js to ensure continuous expense tracking without network connectivity.

Improved

Apple HIG Touch Ergonomics: Enlarged all numeric keys and category pill targets to meet or exceed 48×48px bounding boxes for comfortable one-handed thumbs-only entry.

iOS Safari Viewport Stabilization: Applied user-scalable=no, viewport-fit=cover and disabled double-tap auto-zoom on input elements.

Haptic Tactile Feedback: Integrated Web Vibration API (navigator.vibrate) for keypresses and successful entries.

Local Storage Reliability: Formatted JSON data structures in localStorage with automated migration guards.

Dynamic Settlement Engine: Real-time net balance evaluation updated on every keystroke and transaction change.

Fixed

Floating-Point Currency Precision: Corrected penny/cent rounding discrepancies in 50/50 balance splits (toFixed(1)).

Mobile Safe Area Docking: Eliminated layout collisions with iPhone Home Indicator (env(safe-area-inset-bottom)).

Zero-State Empty View: Added helpful empty-state guidance when no transactions exist.

v0.9.0 Beta Release Notes

New

Initial prototype of the 4-column numpad layout.

Basic 50/50 split math calculation.

Local list view with single-tap deletion.

Improved

Refined contrast ratios for WCAG AA compliance on dark backgrounds.

Streamlined category taxonomy from 16 generic options down to the 4 most frequent Gen Z daily expenses.

🛠 Architecture & Tech Stack

Web / PWA Version: Single-file semantic HTML5, CSS3 Custom Properties, Vanilla JavaScript (ES6+), Web Manifest, Service Worker.

iOS Native Version: Swift 5.9+, SwiftUI 5.0, SwiftData, Apple CloudKit (CKShare).

Platform Compatibility: iOS Safari (PWA Standalone), macOS, Chrome, and all modern mobile browsers.

Data Privacy: 100% Client-side. Zero remote database tracking, zero advertising SDKs.

📋 Versioning Policy

Major function (vX.0.0): Architectural overhauls, backend sync protocol shifts, major multi-currency engines.

Minor function (v0.X.0): New categories, custom themes, export formats (CSV/Excel), or widget additions.

Bug-fix-only (v0.0.X): Visual polish, alignment adjustments, touch-target refinements, and calculation fixes.

Release notes are cumulative; newest release remains at the top and previous releases are retained.

📄 License

Released under the MIT License.
