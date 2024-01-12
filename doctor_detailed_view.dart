import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manipal_enterprise/di.dart';
import 'package:manipal_enterprise/models/doctor.dart';
import 'package:manipal_enterprise/services/doctor_service.dart';
import 'package:manipal_enterprise/services/notification_service.dart';

class DoctorDetailedView extends StatelessWidget {
  const DoctorDetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctor;
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Hero(
                tag: doctor.name,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.45,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                    image: DecorationImage(
                      image: NetworkImage(doctor.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 26),
                        ),
                        Text(
                          doctor.specialization,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 20,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        ratingBox(context),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(doctor.rating.toString(),
                                style: Theme.of(context).textTheme.labelLarge),
                            Text("Review",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Colors.grey[600],
                                      fontSize: 16,
                                    ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Visiting hour",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                        Text(
                          doctor.visitingHours,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 14),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Patients",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                        Text(
                          doctor.patientsTreated.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontSize: 14),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Biography",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(doctor.biography),
              ),
            ],
          ),
          Positioned(
            left: 0,
            top: 30,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
            ),
          )
        ],
      ),
      floatingActionButton: FilledButton(
        onPressed: () => showPaymentSheet(context, doctor),
        child: Text("Book Appointment"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget ratingBox(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        Icons.star_border,
        color: Colors.white,
      ),
    );
  }

  void showPaymentSheet(BuildContext context, Doctor doctor) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => BottomSheet(
        onClosing: () {
          Navigator.pop(context);
        },
        builder: (_) => Padding(
          // width: double.infinity,
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Book Appointment",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 20,
                    ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "300₹",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 20,
                    ),
              ),
              Card(
                child: ListTile(
                  title: Text("GPay"),
                  contentPadding: EdgeInsets.all(10),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://scoopsquare24.com/wp-content/uploads/2021/05/Google_Pay_Featured-1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  trailing: Checkbox(value: true, onChanged: (val) {}),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Phonepe"),
                  contentPadding: EdgeInsets.all(10),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.siasat.com/wp-content/uploads/2021/03/PhonePe.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  trailing: Checkbox(value: false, onChanged: (val) {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => displayNotification(context, doctor),
                      child: Text("Pay Later"),
                    ),
                    Spacer(),
                    FilledButton(
                      onPressed: () => displayNotification(context, doctor),
                      child: Text("Pay Now"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void displayNotification(BuildContext context, Doctor doctor) async {
    final doctorService = sl<DoctorService>();
    try {
      final token = await doctorService.makeAppointment(doctor.id);

      sl<NotificationService>().showNotification(
        title: "Token No - $token",
        body:
            "Appointment with ${doctor.name} is at ${doctor.visitingHours.split(',').last}",
      );
      // Navigator.pop(context);
    } catch (e) {
      showNoAppointmentDialog(context);
    }
  }

  void showNoAppointmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Appointments are full"),
        content: Text("Try again later"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Ok"),
          )
        ],
      ),
    );
  }
}
