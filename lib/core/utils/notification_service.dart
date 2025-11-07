// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// // معالج الإشعارات في الخلفية (خارج الكلاس)
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("معالجة إشعار في الخلفية: ${message.messageId}");
//   // يمكن تشغيل صوت هنا أيضاً
// }
//
// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//   NotificationService._internal();
//
//   final FlutterLocalNotificationsPlugin _notificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   // تهيئة الإشعارات
//   Future<void> initialize() async {
//     // طلب الأذونات
//     await _requestPermissions();
//
//     // إعدادات Android
//     const AndroidInitializationSettings androidSettings =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     // إعدادات iOS
//     const DarwinInitializationSettings iosSettings =
//     DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );
//
//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );
//
//     await _notificationsPlugin.initialize(
//       initSettings,
//       onDidReceiveNotificationResponse: (details) {
//         // عند الضغط على الإشعار
//         _handleNotificationClick(details);
//       },
//     );
//
//     // تهيئة Firebase Messaging
//     await _initializeFirebaseMessaging();
//   }
//
//   // طلب الأذونات
//   Future<void> _requestPermissions() async {
//     // أذونات Android 13+
//     if (await Permission.notification.isDenied) {
//       await Permission.notification.request();
//     }
//
//     // أذونات iOS
//     await _firebaseMessaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//       provisional: false,
//     );
//   }
//
//   // تهيئة Firebase Cloud Messaging
//   Future<void> _initializeFirebaseMessaging() async {
//     // الحصول على FCM Token
//     String? token = await _firebaseMessaging.getToken();
//     print('FCM Token: $token');
//     // يجب إرسال هذا التوكن للسيرفر
//
//     // معالج الإشعارات في المقدمة (التطبيق مفتوح)
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('رسالة جديدة: ${message.notification?.title}');
//       _showLocalNotification(
//         title: message.notification?.title ?? 'طلب جديد',
//         body: message.notification?.body ?? 'لديك طلب جديد',
//         payload: message.data.toString(),
//       );
//     });
//
//     // عند فتح التطبيق من خلال الإشعار
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('تم فتح التطبيق من الإشعار');
//       _handleNotificationClick(null);
//     });
//
//     // معالج الخلفية
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }
//
//   // عرض إشعار محلي مع صوت
//   Future<void> _showLocalNotification({
//     required String title,
//     required String body,
//     String? payload,
//   }) async {
//     // إعدادات الصوت والأهمية لـ Android
//     const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//       'orders_channel', // معرف القناة
//       'طلبات التوصيل', // اسم القناة
//       channelDescription: 'إشعارات الطلبات الجديدة',
//       importance: Importance.max,
//       priority: Priority.high,
//       sound: RawResourceAndroidNotificationSound('notification'), // ملف الصوت
//       playSound: true,
//       enableVibration: true,
//       enableLights: true,
//
//       icon: '@mipmap/ic_launcher',
//     );
//
//     // إعدادات iOS
//     const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//       sound: 'notification.wav', // ملف الصوت لـ iOS
//     );
//
//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidDetails,
//       iOS: iosDetails,
//     );
//
//     await _notificationsPlugin.show(
//       DateTime.now().millisecond, // معرف فريد
//       title,
//       body,
//       notificationDetails,
//       payload: payload,
//     );
//   }
//
//   // معالجة الضغط على الإشعار
//   void _handleNotificationClick(NotificationResponse? response) {
//     // الانتقال لصفحة معينة أو تنفيذ إجراء
//     print('تم الضغط على الإشعار: ${response?.payload}');
//     // يمكنك استخدام Navigator هنا للانتقال لصفحة الطلبات
//   }
//
//   // إرسال إشعار اختبار
//   Future<void> sendTestNotification() async {
//     await _showLocalNotification(
//       title: '🔔 طلب جديد',
//       body: 'لديك طلب توصيل جديد من منارة أمجاد',
//     );
//   }
//
//   // إلغاء جميع الإشعارات
//   Future<void> cancelAllNotifications() async {
//     await _notificationsPlugin.cancelAll();
//   }
//
//   // الحصول على FCM Token
//   Future<String?> getFCMToken() async {
//     return await _firebaseMessaging.getToken();
//   }
//
//   // حذف FCM Token
//   Future<void> deleteFCMToken() async {
//     await _firebaseMessaging.deleteToken();
//   }
// }