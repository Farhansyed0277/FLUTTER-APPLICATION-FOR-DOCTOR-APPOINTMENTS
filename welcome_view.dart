import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                'assets/doctor.png',
              ),
              height: MediaQuery.sizeOf(context).height * 0.6,
              width: MediaQuery.sizeOf(context).width * 0.7,
            ),
            Text(
              "Manipal Health Enterprise",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              height: 46,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/phone'),
                child: const Text(
                  "Get Started",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
