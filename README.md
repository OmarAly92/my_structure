# 🧱 my_structure (v1.0.1)

`my_structure` is a scalable and modular Flutter project template designed with flexibility in mind. It adheres to the **MVVM** (Model-View-ViewModel) architecture and can be easily adapted to **Clean Architecture** when needed. This structure promotes clean code separation, enhanced maintainability, and accelerated development workflows.

---

## 📦 What's Inside

### 🔧 `core/` - Shared Logic and Configuration

A central hub for all foundational and cross-cutting concerns of your Flutter app:

- `api/`: Includes `DioConsumer`, `api_consumer`, and `refresh_token_interceptor`, forming a robust, professional-grade network layer. Features include custom timeouts, automatic token injection, retry handling, Talker-based debug logging, and centralized error transformation.
- `app_routes/`: Manages centralized route naming and navigation references.
- `app_themes/`: Handles light/dark theme configurations, text styles, and theme switching with Cubit.
- `error_handling/`: Implements a clean failure architecture using custom `Failure` classes and Dio exception mapping. All errors are logged with `AppLogger`, complete with full stack traces for efficient debugging.
- `helpers/`: Contains utility logic such as localization, validation, popup builders, and date helpers.
- `utils/`: Defines constants, enums, string keys, asset paths, and environment configurations.

### 🧱 `widgets/` - Reusable UI Components

A well-organized collection of reusable widgets and components for consistent UI development:

- `main_widgets/`: Core widgets like `AppButton`, `AppText`, `AppScaffold`, and `GlobalAppBar`.
- `failure_widgets/`, `loading_widget/`: Unified loading and error feedback UI.
- `responsive_widgets/`: Layout utilities like `AdaptiveColumn`, `ResponsiveRow`, and builder patterns.
- `screens_components/`: Higher-order components like `BottomSheetContainer`, `CustomCalendar`, and `DotIndicator`.
- `package_widgets/`: Wrappers for enhanced third-party widgets (`AppShimmer`, `AppSlider`, `AppAnimate`, etc.).

---

## 📁 Feature Folder Structure (MVVM)

Each feature is self-contained and follows a clear structure. For example:

```
auth/
├── data/
│   ├── data_source/
│   ├── models/
│   └── repository/
└── presentation/
    ├── login_screen/
    │   ├── logic/
    │   │   ├── login_cubit.dart
    │   │   └── login_state.dart
    │   └── ui/
    │       ├── login_screen.dart
    │       └── widgets/
    │           └── login_body.dart
    └── sign_up_screen/
        ├── logic/
        │   ├── sign_up_cubit.dart
        │   └── sign_up_state.dart
        └── ui/
            ├── sign_up_screen.dart
            └── widgets/
                └── sign_up_body.dart
```

### Why This Structure?

- 🧩 **Modular Design**: Each screen is isolated in its own folder for logic and UI.
- 🛠️ **Scalable**: Easy to extend, refactor, or migrate to Clean Architecture.
- 🔄 **Maintainable**: Changes in one screen won’t affect others.
- 🧠 **Clear Ownership**: Teams can work on different screens independently.

---

## ⚙️ Flutter Structure Generator Plugin

Accelerate your workflow using the [Flutter Structure Generator](https://plugins.jetbrains.com/plugin/24854-flutter-structure-generator?noRedirect=true) plugin for JetBrains IDEs like Android Studio.

### What It Does

- 🏗️ Generates entire features with MVVM or Clean Architecture structure.
- 🧱 Scaffolds individual screens with logic and UI layers.
- ⚡ Reduces setup time and enforces consistent architecture patterns.
<img width="1720" alt="image" src="https://github.com/user-attachments/assets/9ba344be-e6f3-4a19-a639-672f91c49b1f" />

---

## 💡 Migrating to Clean Architecture

Converting a feature to Clean Architecture is straightforward:

- Create a `domain/` layer for `entities/` and `use_cases/`.
- Move business logic from Cubits into `use_cases/`.
- Interface repositories in `domain/` and implement them in `data/`.

This lets you incrementally adopt Clean Architecture as your app grows.

---

## 🚀 Getting Started

1. Clone this repository.
2. Use the Flutter Structure Generator plugin to scaffold features or screens.
3. Implement logic in `Cubit`, UI in the widget layer, and data in the appropriate modules.
4. Run your app and scale confidently.

---

## 📄 License

This project is licensed under the MIT License.
