import 'package:test/test.dart';
import '../bin/exam4/exam4.dart';

void main() {
  final dicodingStudent = DicodingStudent('John Doe', 25);

  test('Exam 4 - TODO 1', () {
    expect(dicodingStudent.fullName, isA<String>(),
        reason: "Properti `fullName` harus bertipe String");
    expect(dicodingStudent.age, isA<int>(),
        reason: "Properti `age` harus bertipe int");

    expect(dicodingStudent.fullName, equals('John Doe'),
        reason: "fullName harus 'John Doe'");
    expect(dicodingStudent.age, equals(25),
        reason: "age harus 25");

    expect(dicodingStudent.incrementAge(), 26,
        reason: "incrementAge() harus mengembalikan 26");
  });

  test('Exam 4 - TODO 2', () async {
    var startTime = DateTime.now();
    var result = await dicodingStudent.getStudentInfo();
    var endTime = DateTime.now();
    var duration = endTime.difference(startTime);

    expect(result, isA<String>());
    expect(result, equals('Nama Lengkap: John Doe, Umur: 25 tahun'));
    
    // Lebih toleran dengan range waktu
    expect(
      duration.inMilliseconds,
      greaterThanOrEqualTo(2900), // Minimal 2.9 detik
      reason: 'Delay harus sekitar 3 detik',
    );
  });

  test('Exam 4 - TODO 3', () {
    final student = createStudent();

    expect(student, isA<DicodingStudent>());
    
    // Regex yang mengizinkan spasi dan huruf besar/kecil
    expect(
      RegExp(r'^[a-zA-Z\s]+$').hasMatch(student.fullName),
      isTrue,
      reason: 'Nama hanya boleh mengandung huruf dan spasi',
    );
    
    expect(student.fullName.split(' ').length, greaterThanOrEqualTo(2),
        reason: 'Nama harus terdiri dari minimal 2 kata');
        
    expect(student.age, inInclusiveRange(15, 99));
    
    // Pastikan ini benar-benar instance baru
    expect(student, isNot(equals(dicodingStudent)));
  });
}