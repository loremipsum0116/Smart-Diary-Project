import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';
import '../models/todo_model.dart';

/// 로컬 알림을 관리하는 싱글톤 클래스
class NotificationManager {
  static final NotificationManager _instance = NotificationManager._internal();
  factory NotificationManager() => _instance;
  NotificationManager._internal();

  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  /// 알림 시스템 초기화
  Future<void> initialize() async {
    if (_initialized) return;

    // Timezone 데이터 초기화
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));

    // Android 초기화 설정
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS 초기화 설정
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    _initialized = true;
  }

  /// 알림 클릭 시 처리
  void _onNotificationTapped(NotificationResponse response) {
    // 알림 클릭 시 앱이 열리고 해당 todo로 이동하는 로직 추가 가능
    // payload에 todo id를 담아서 전달할 수 있음
  }

  /// 알림 권한 요청
  Future<bool> requestPermissions() async {
    if (await Permission.notification.isGranted) {
      return true;
    }

    final status = await Permission.notification.request();
    return status.isGranted;
  }

  /// Todo를 위한 알림 스케줄링
  Future<void> scheduleTodoNotification(Todo todo) async {
    if (!_initialized) await initialize();

    // 알림이 없거나 마감일이 없으면 스킵
    if (todo.notificationTime == null || todo.dueDate == null) {
      return;
    }

    // 권한 확인
    if (!await requestPermissions()) {
      return;
    }

    // 알림 시간 계산
    final notificationDateTime = _calculateNotificationTime(
      todo.dueDate!,
      todo.notificationTime!,
    );

    // 과거 시간이면 알림하지 않음
    if (notificationDateTime.isBefore(DateTime.now())) {
      return;
    }

    // Timezone 변환
    final scheduledDate = tz.TZDateTime.from(notificationDateTime, tz.local);

    // 알림 상세 설정
    final androidDetails = AndroidNotificationDetails(
      'todo_channel',
      'Todo 알림',
      channelDescription: '할 일 마감 알림',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      sound: const RawResourceAndroidNotificationSound('notification'),
      enableVibration: true,
      playSound: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: 'default',
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // 알림 스케줄링
    await _notifications.zonedSchedule(
      todo.id.hashCode, // 고유 ID
      '📌 ${todo.title}',
      _buildNotificationBody(todo),
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: todo.id, // Todo ID 전달
    );
  }

  /// 알림 본문 생성
  String _buildNotificationBody(Todo todo) {
    final buffer = StringBuffer();

    if (todo.description.isNotEmpty) {
      buffer.write(todo.description);
    } else {
      buffer.write('할 일이 예정되어 있습니다.');
    }

    // 우선순위 표시
    if (todo.priority == TodoPriority.high) {
      buffer.write(' [높은 우선순위]');
    }

    return buffer.toString();
  }

  /// 알림 시간 계산
  DateTime _calculateNotificationTime(DateTime dueDate, DateTime notificationTime) {
    // notificationTime의 시간과 분을 dueDate에 적용
    return DateTime(
      dueDate.year,
      dueDate.month,
      dueDate.day,
      notificationTime.hour,
      notificationTime.minute,
    );
  }

  /// 특정 Todo 알림 취소
  Future<void> cancelTodoNotification(String todoId) async {
    await _notifications.cancel(todoId.hashCode);
  }

  /// 모든 알림 취소
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// 예정된 알림 목록 가져오기
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await _notifications.pendingNotificationRequests();
  }

  /// 즉시 알림 표시 (테스트용)
  Future<void> showImmediateNotification(String title, String body) async {
    if (!_initialized) await initialize();

    const androidDetails = AndroidNotificationDetails(
      'test_channel',
      '테스트 알림',
      channelDescription: '즉시 표시되는 테스트 알림',
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      notificationDetails,
    );
  }

  /// 반복 알림 설정 (미래 확장용)
  Future<void> scheduleRepeatingNotification(
    Todo todo,
    NotificationInterval interval,
  ) async {
    if (!_initialized) await initialize();
    if (interval == NotificationInterval.none) return;

    final duration = interval.duration;
    if (duration == null) return;

    // 반복 알림은 flutter_local_notifications의 periodicallyShow 사용
    // 정확한 시간 지정이 필요한 경우 여러 개의 zonedSchedule 사용
  }

  // 기존 메서드들 (하위 호환성 유지)
  static DateTime? calculateNextNotification(
    DateTime startTime,
    NotificationInterval interval,
  ) {
    final duration = interval.duration;
    if (duration == null) return null;

    DateTime nextTime = startTime.add(duration);

    while (nextTime.isBefore(DateTime.now())) {
      nextTime = nextTime.add(duration);
    }

    return nextTime;
  }

  static bool shouldNotify(
    DateTime? lastNotificationTime,
    NotificationInterval interval,
  ) {
    if (interval == NotificationInterval.none || lastNotificationTime == null) {
      return false;
    }

    final duration = interval.duration;
    if (duration == null) return false;

    final nextNotificationTime = lastNotificationTime.add(duration);
    return DateTime.now().isAfter(nextNotificationTime);
  }
}
