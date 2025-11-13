import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/home_page.dart';
import 'screens/ai_advice_page.dart';
import 'managers/notification_manager.dart';

// ───────────────── Entry
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // 로케일 데이터 초기화 (한국어)
    await initializeDateFormatting('ko', null);

    // 알림 시스템 초기화
    await NotificationManager().initialize();

    // Firebase 초기화 완전 비활성화 (로컬 모드)
  } catch (e) {
    // 초기화 오류 무시
  }

  runApp(const MyAppRoot());
}

class MyAppRoot extends StatelessWidget {
  const MyAppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => const HomePage(),
        '/ai-advice': (_) => const AIAdvicePage(),
      },
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
    );
  }
}

