import 'dart:isolate';
import 'package:auth/firebase_options.dart';
import 'package:auth/src/features/authentication/screens/chatbot/providers/chats_provider.dart';
import 'package:auth/src/features/authentication/screens/chatbot/providers/models_provider.dart';
import 'package:auth/src/features/authentication/screens/moodtracker/features/activities/model/activity.dart';
import 'package:auth/src/features/authentication/screens/moodtracker/features/mood_records/data/mood_log/mood_record_repository.dart';
import 'package:auth/src/features/authentication/screens/moodtracker/features/mood_records/domain/mood_log/mood_record.dart';
import 'package:auth/src/repository/authentication_repository/authentication_repository.dart';
import 'package:auth/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MoodRecordAdapter());
  Hive.registerAdapter(ActivityAdapter());

  final moodRecordsRepository = await MoodRecordRepository.createRepository();

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    ProviderScope(
      overrides: [
        ChangeNotifierProvider((_) => ModelsProvider()),
        ChangeNotifierProvider((_) => ChatProvider()),
        Provider((_) => moodRecordsRepository),
      ],
      child: const App(),
    ),
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(message.notification?.title.toString());
  print(message.notification!.body.toString());
  print(message.data.toString());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.darkTheme,
      darkTheme: TAppTheme.lightTheme,
      themeMode: ThemeMode.dark,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
