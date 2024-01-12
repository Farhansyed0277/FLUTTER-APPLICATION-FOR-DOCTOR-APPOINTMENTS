import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:manipal_enterprise/views/decider_view.dart';
import 'package:manipal_enterprise/views/doctor_detailed_view.dart';
import 'package:manipal_enterprise/views/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manipal Health Enterprise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const DeciderView(),
        '/doctor': (_) => const DoctorDetailedView(),
        '/home': (_) => const HomeView(),
        '/phone': (_) => PhoneInputScreen(
              actions: [
                SMSCodeRequestedAction(
                  (context, action, flowKey, phoneNumber) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SMSCodeInputScreen(
                          flowKey: flowKey,
                          actions: [
                            AuthStateChangeAction<SigningIn>((context, state) {
                              Navigator.restorablePushNamedAndRemoveUntil(
                                  context, '/home', (route) => false);
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
        '/profile': (_) => ProfileScreen(
              appBar: AppBar(
                title: const Text("User Profile"),
              ),
              actions: [
                SignedOutAction((context) {
                  Navigator.pushNamed(context, '/');
                }),
              ],
            ),
      },
    );
  }
}
