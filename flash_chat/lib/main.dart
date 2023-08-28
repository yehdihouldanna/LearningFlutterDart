import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screens.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: WelcomeScreen(), //  alternative to initialRoute if we have only one screen
      initialRoute: WelcomeScreen.id,

      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: ((context) => LoginScreen()),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: ((context) => ChatScreen()),
      },

      // routes: {
      //   '/home': (context) => WelcomeScreen(),
      //   'login': ((context) => LoginScreen()),
      //   'register': (context) => RegistrationScreen(),
      //   'chat': ((context) => ChatScreen()),
      // },
    );
  }
}
