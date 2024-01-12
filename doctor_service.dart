import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manipal_enterprise/models/doctor.dart';

class DoctorService {
  final FirebaseFirestore _firestore;

  const DoctorService(this._firestore);

  dynamic makeAppointment(String id) async {
    final docRef = _firestore.collection('doctors').doc(id);
    final docSnap = await docRef.get();
    final doctor = Doctor.fromJson(docSnap.data());

    if (doctor.appointments >= 20) {
      throw Exception('Appointments are Full');
    } else {
      docRef.update({'appointments': doctor.appointments + 1});
      return doctor.appointments + 1;
    }
  }

  Future<List<Doctor>> getDoctors() async {
    final data = await _firestore.collection('doctors').get();

    return data.docs.map((doc) => Doctor.fromJson(doc.data())).toList();
  }
}
