import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manipal_enterprise/di.dart';
import 'package:manipal_enterprise/views/home_view.dart';
import 'package:manipal_enterprise/views/welcome_view.dart';

class DeciderView extends StatelessWidget {
  const DeciderView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = sl<FirebaseAuth>().currentUser;

    return user != null ? HomeView() : WelcomeView();
  }
}
