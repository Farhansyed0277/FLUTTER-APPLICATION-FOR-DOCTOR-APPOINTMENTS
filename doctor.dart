class Doctor {
  final String id;
  final String name;
  final String specialization;
  final double rating;
  final String visitingHours;
  final int patientsTreated;
  final String biography;
  final String image;
  final int appointments;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.rating,
    required this.visitingHours,
    required this.patientsTreated,
    required this.biography,
    required this.image,
    required this.appointments,
  });

  dynamic toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'rating': rating,
      'visiting_hours': visitingHours,
      'patients_treated': patientsTreated,
      'biography': biography,
      'appointments': 0
    };
  }

  static Doctor fromJson(dynamic json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      rating: json['rating'],
      visitingHours: json['visiting_hours'],
      patientsTreated: json['patients_treated'],
      biography: json['biography'],
      image: json['image'],
      appointments: json['appointments'],
    );
  }
}
