# Smart Diary

An AI-powered diary and todo management application built with Flutter and Google Gemini AI.

## Features

### 📝 AI-Powered Diary
- **Category-Specific Analysis**: Daily, Study, and Travel diary modes with tailored AI insights
- **Automatic Theme Suggestions**: AI recommends themes, colors, and stickers based on diary content
- **Smart Tags**: Automatically generated tags from diary entries
- **Rich Content**: Support for text, images, stickers, and custom themes

### ✅ Smart Todo Management
- **Priority-Based Organization**: High, Medium, and Low priority tasks
- **Categories**: Organize tasks by Work, Personal, Study, Shopping, and Health
- **Subtask Support**: Break down complex tasks into manageable steps
- **Progress Tracking**: Visual progress indicators for tasks with subtasks
- **Calendar Integration**: View todos by date with calendar view
- **Notifications**: Set reminders for important tasks

### 🤖 AI Insights
- **Mood Analysis**: Track emotional patterns over time
- **Productivity Insights**: Analyze task completion rates and patterns
- **Study Analysis**: For study diaries, get subject-specific insights
- **Quiz Generation**: Automatically generate quiz questions from study notes

### 📊 Analytics Dashboard
- Diary statistics and trends
- Todo completion analytics
- Category-based insights
- Time-based analysis

## Tech Stack

- **Framework**: Flutter (Dart)
- **AI Integration**: Google Gemini 2.0 Flash API
- **Storage**: SharedPreferences (local-first approach)
- **Platforms**: iOS, Android, Web, Windows

## Setup Instructions

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Google Gemini API Key

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/loremipsum0116/Smart-Diary-Project.git
   cd Smart-Diary-Project
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API Keys**

   Create a file `lib/config/api_keys.dart`:
   ```dart
   class ApiKeys {
     static const String geminiApiKey = 'YOUR_GEMINI_API_KEY_HERE';
   }
   ```

   Get your Gemini API key from: https://makersuite.google.com/app/apikey

4. **Run the app**
   ```bash
   flutter run
   ```

### Building for Release

#### Android
1. Create a keystore:
   ```bash
   keytool -genkey -v -keystore ~/smart-diary-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias smart-diary
   ```

2. Create `android/key.properties`:
   ```properties
   storePassword=<your-store-password>
   keyPassword=<your-key-password>
   keyAlias=smart-diary
   storeFile=<path-to-keystore>
   ```

3. Build the APK:
   ```bash
   flutter build apk --release
   ```

#### iOS
1. Configure signing in Xcode
2. Build:
   ```bash
   flutter build ios --release
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── config/
│   └── api_keys.dart        # API keys (gitignored)
├── models/
│   ├── diary_models.dart    # Diary data models
│   ├── todo_model.dart      # Todo data models
│   └── analysis_models.dart # AI analysis models
├── screens/
│   ├── home_page.dart       # Main screen with tabs
│   ├── diary_main_page.dart # Diary list view
│   ├── diary_editor_page.dart # Diary creation/editing
│   ├── ai_advice_page.dart  # AI insights tab
│   ├── calender_page.dart   # Calendar view
│   ├── quiz_bank_page.dart  # Study quiz questions
│   └── settings_page.dart   # App settings
├── services/
│   ├── diary_service.dart   # Diary CRUD operations
│   ├── ai_diary_service.dart # AI analysis service
│   └── admin_service.dart   # Admin utilities
├── managers/
│   ├── category_manager.dart    # Category management
│   ├── notification_manager.dart # Notification handling
│   ├── progress_manager.dart    # Progress tracking
│   └── subtask_manager.dart     # Subtask operations
└── widgets/
    ├── todo_tile.dart       # Todo list item
    ├── add_todo_dialog.dart # Todo creation dialog
    └── ai_insights_tab.dart # AI insights display
```

## Privacy & Data Storage

- **Local-First**: All data is stored locally on your device using SharedPreferences
- **No Cloud Sync**: Currently does not sync data across devices
- **AI Processing**: Diary content is sent to Google Gemini API for analysis
- **Data Control**: You have full control over your data; uninstalling the app removes all data

## API Usage

This app uses the Google Gemini API for AI features:
- Diary content analysis
- Mood detection
- Tag and theme suggestions
- Quiz generation from study notes

Please review Google's terms of service and ensure compliance with API usage limits.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Google Gemini AI for powerful language understanding
- Flutter team for the excellent cross-platform framework
- All contributors and users of this project

## Support

For issues, questions, or suggestions, please open an issue on GitHub:
https://github.com/loremipsum0116/Smart-Diary-Project/issues

---

Built with ❤️ using Flutter and AI
