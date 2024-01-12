import 'package:flutter/material.dart';
import 'package:manipal_enterprise/di.dart';
import 'package:manipal_enterprise/services/doctor_service.dart';
import 'package:manipal_enterprise/widgets/doctor_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipal Health Enterprise"),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushNamed(context, '/profile');
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: FutureBuilder(
        future: sl<DoctorService>().getDoctors(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error -> ${snapshot.error}"),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            final doctors = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: doctors.length,
              itemBuilder: (context, index) =>
                  DoctorCard(doctor: doctors[index]),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
