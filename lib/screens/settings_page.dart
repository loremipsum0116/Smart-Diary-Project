import 'package:flutter/material.dart';
import '../managers/notification_manager.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        children: [
          const ListTile(
            title: Text('알림 설정', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          ListTile(
            title: const Text('알림 테스트'),
            subtitle: const Text('즉시 테스트 알림을 받아봅니다'),
            trailing: const Icon(Icons.notifications_active),
            onTap: () async {
              await NotificationManager().showImmediateNotification(
                '테스트 알림',
                '알림이 정상적으로 작동합니다! 🎉',
              );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('테스트 알림을 보냈습니다!')),
                );
              }
            },
          ),
          ListTile(
            title: const Text('알림 권한 요청'),
            subtitle: const Text('알림 권한을 다시 요청합니다'),
            trailing: const Icon(Icons.settings),
            onTap: () async {
              final granted = await NotificationManager().requestPermissions();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      granted ? '알림 권한이 허용되었습니다' : '알림 권한이 거부되었습니다',
                    ),
                  ),
                );
              }
            },
          ),
          ListTile(
            title: const Text('예정된 알림 확인'),
            subtitle: const Text('현재 예약된 알림 목록을 확인합니다'),
            trailing: const Icon(Icons.list),
            onTap: () async {
              final pending = await NotificationManager().getPendingNotifications();
              if (context.mounted) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('예정된 알림'),
                    content: Text(
                      pending.isEmpty
                          ? '예정된 알림이 없습니다'
                          : pending.map((n) => '${n.id}: ${n.title}\n${n.body}').join('\n\n'),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('확인'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          ListTile(
            title: const Text('모든 알림 취소'),
            subtitle: const Text('예약된 모든 알림을 취소합니다'),
            trailing: const Icon(Icons.clear_all),
            onTap: () async {
              await NotificationManager().cancelAllNotifications();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('모든 알림이 취소되었습니다')),
                );
              }
            },
          ),
          const Divider(),
          const ListTile(
            title: Text('앱 정보', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          const ListTile(
            title: Text('버전'),
            subtitle: Text('1.0.0'),
          ),
          const ListTile(
            title: Text('개발자'),
            subtitle: Text('Smart Diary Team'),
          ),
        ],
      ),
    );
  }
}
