import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photochatapp/app/app.dart';
import 'package:photochatapp/services/AuthenticationService.dart';
import 'package:photochatapp/services/context/app_context.dart';
import 'package:photochatapp/services/states/app_running_states.dart';
import 'package:photochatapp/services/theme/base_theme_service.dart';
import 'package:photochatapp/services/theme/prod_theme_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  AppTheme appTheme = ProdAppTheme();
  WidgetsFlutterBinding.ensureInitialized();
  AppContext appContext =
      AppContext(appRunningStateOverride: AppRunningState.PRODUCTION);
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        ChangeNotifierProvider(create: (context) => appTheme),
        ChangeNotifierProvider(create: (context) => appContext),
      ],
      child: PhotoChatApp(),
    ),
  );
}
