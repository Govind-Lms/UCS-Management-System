class StudentDataModel {
  late bool attendance;
  final String name;
  final String rollNo;
  final String mail;
  final String image;
  final String timeduration;
  final String year;

  StudentDataModel({
    required this.timeduration,
    required this.attendance,
    required this.name,
    required this.rollNo,
    required this.mail,
    required this.image,
    required this.year,
  });
}
