# 👁️ LensDay

**LensDay** is a simple, privacy-friendly iOS app that helps you track how many days you’ve been wearing your current contact lenses — and when it’s time to replace them.

---

## 🧭 Overview

LensDay was designed to be **fast, free, and frustration-free**.  
Most contact tracking apps hide basic countdown features behind subscriptions or ads — LensDay keeps it clean and local.

---

## 🚀 Features

- 🗓️ **Track Wear Duration:** Enter your start date and lens lifespan (daily, bi-weekly, monthly, etc.)  
- 🔢 **Automatic Countdown:** See “days worn” and “days left” update automatically  
- 💾 **Persistent Storage:** Data is saved securely on your device — no accounts or cloud sync required  
- 🔔 **Widget Support (coming soon):** See your remaining days directly on your Home Screen  
- 🎨 **Simple SwiftUI Interface:** Built natively for iOS using Swift and SwiftUI  

---

## 🛠️ Technical Details

- **Language:** Swift  
- **Framework:** SwiftUI  
- **Persistence:** `@AppStorage` (UserDefaults)  
- **Planned Additions:**
  - App Group shared storage for widgets  
  - Local notifications for replacement reminders  
  - Optional left/right lens tracking  

---

## 🧩 How to Build

1. Open `LensDay.xcodeproj` in **Xcode 15+**  
2. Ensure Interface = **SwiftUI**, Language = **Swift**  
3. Build and run on Simulator or device  
4. Adjust your start date and duration — LensDay will remember it automatically  

---

## 🧠 Design Philosophy

LensDay aims to:
- Respect your time and data  
- Be transparent about calculations  
- Keep all logic on-device  

No sign-ups, no ads, no nonsense. Just clean subtraction and a daily reminder to replace your lenses on time.

---

## 📅 Roadmap

| Version | Features |
|----------|-----------|
| **1.0** | Core tracker with persistent data |
| **1.1** | Home Screen widget (systemSmall) |
| **1.2** | Notifications & “Replace Now” shortcut |
| **1.3** | Separate tracking for left/right lenses |

---

## 🧑‍💻 Author

**LensDay**  
Created with ❤️ in SwiftUI.  
All logic is open for learning and improvement.

---


