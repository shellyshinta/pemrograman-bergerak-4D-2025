import 'exam4.dart';

Future<void> main() async {
  final praktikanStudent = PraktikanStudent('Lutfi', 18);

  print('Full Name = ${praktikanStudent.fullName}');
  print('Age       = ${praktikanStudent.age}');

  print('Age + 1   = ${praktikanStudent.incrementAge()}');

  final studentInfo = await praktikanStudent.getStudentInfo();
  print(studentInfo);

  print(await createStudent().fullName);
  print(await createStudent().age);
}
