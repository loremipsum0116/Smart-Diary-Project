# Privacy Policy for Smart Diary

**Last Updated:** November 13, 2025

## Introduction

Smart Diary ("we", "our", or "the app") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and safeguard your information when you use our mobile application.

## Information We Collect

### Local Data Storage
- **Diary Entries**: All diary content, including text, images, tags, and themes
- **Todo Items**: Task descriptions, categories, priorities, due dates, and completion status
- **App Settings**: User preferences and configuration options
- **Usage Statistics**: Local analytics for app improvement (stored on device only)

### Data Sent to Third-Party Services

#### Google Gemini AI API
When you use AI analysis features, the following data is sent to Google's Gemini API:
- Diary content text (for mood analysis, tag suggestions, and theme recommendations)
- Study diary content (for quiz question generation)

**Important**:
- We do NOT store your API responses on our servers
- Data is transmitted securely using HTTPS
- Please review [Google's AI Terms of Service](https://ai.google.dev/terms) for details on how Google processes this data

### Data We Do NOT Collect
- Personal identification information (name, email, phone number)
- Device identifiers for tracking
- Location data
- Contacts or other device data
- Payment information (app is free)

## How We Use Your Information

### Local Processing
All diary entries and todo items are stored locally on your device using Flutter's SharedPreferences. This data:
- Never leaves your device except when explicitly sent to Gemini API for analysis
- Is not backed up to cloud services
- Is not shared with third parties
- Is completely deleted when you uninstall the app

### AI Analysis
When you request AI analysis:
1. Your diary content is sent to Google Gemini API
2. The API processes the text and returns insights
3. The insights are displayed in the app and stored locally
4. We do not retain copies of your data on any server

## Data Security

### Local Storage Security
- Data is stored using Flutter's secure SharedPreferences
- Access is restricted to the app only
- No external apps can access your diary data

### Network Security
- All API communications use HTTPS encryption
- API keys are securely stored and never exposed in the app
- No authentication tokens are stored on third-party servers

## Data Retention

- **Local Data**: Retained until you delete entries or uninstall the app
- **Cloud Data**: We do not store any of your data in the cloud
- **API Processing**: Google processes your text for analysis but does not retain it (per Google's policies)

## Your Rights and Choices

You have the right to:
- **Access**: View all your data within the app at any time
- **Delete**: Remove individual diary entries or todo items
- **Export**: (Future feature) Export your data in JSON format
- **Opt-out of AI**: Choose not to use AI analysis features
- **Complete Deletion**: Uninstalling the app permanently deletes all local data

## Children's Privacy

Smart Diary is not directed to children under 13. We do not knowingly collect personal information from children under 13. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.

## Third-Party Services

### Google Gemini AI
- **Purpose**: AI analysis of diary content
- **Data Shared**: Diary text content only (when you use AI features)
- **Privacy Policy**: https://policies.google.com/privacy
- **Terms of Service**: https://ai.google.dev/terms

### Flutter Framework
- **Purpose**: App development framework
- **Data Collection**: None from our app
- **Privacy Policy**: https://flutter.dev/privacy

## Changes to This Privacy Policy

We may update this Privacy Policy from time to time. We will notify you of any changes by:
- Updating the "Last Updated" date at the top of this policy
- Displaying a notification in the app (for significant changes)

## International Users

Smart Diary is available worldwide. If you are using the app from outside [Your Country], please note that your data may be processed through Google's global infrastructure. By using the app, you consent to this processing.

## Data Breach Notification

Since all data is stored locally on your device and we do not operate servers storing user data, traditional data breach scenarios do not apply. However:
- If we discover a security vulnerability in the app, we will release an update promptly
- If Google Gemini API is compromised, we will notify users and recommend actions

## Contact Us

If you have questions about this Privacy Policy or our privacy practices, please contact us:

- **GitHub Issues**: https://github.com/loremipsum0116/Smart-Diary-Project/issues
- **Email**: [Your Contact Email]

## Legal Compliance

This Privacy Policy complies with:
- General Data Protection Regulation (GDPR) for EU users
- California Consumer Privacy Act (CCPA) for California residents
- Other applicable data protection laws

## Consent

By using Smart Diary, you consent to this Privacy Policy and agree to its terms.

---

**Note**: This is a template privacy policy. For actual commercial deployment, please:
1. Consult with a legal professional to ensure compliance with all applicable laws
2. Update contact information and company details
3. Review Google's latest terms and privacy policies
4. Consider jurisdiction-specific requirements
