import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  const StudentModel({required this.userId, this.university = '', this.academicLevel = '', this.gpa, this.skillIds = const [], this.interestIds = const []});
  final String userId;
  final String university;
  final String academicLevel;
  final double? gpa;
  final List<String> skillIds;
  final List<String> interestIds;
  factory StudentModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) => StudentModel.fromMap(doc.id, doc.data() ?? const {});
  factory StudentModel.fromMap(String id, Map<String, dynamic> map) => StudentModel(userId: id, university: map['university'] as String? ?? '', academicLevel: map['academicLevel'] as String? ?? '', gpa: (map['gpa'] as num?)?.toDouble(), skillIds: List<String>.from(map['skillIds'] as List? ?? const []), interestIds: List<String>.from(map['interestIds'] as List? ?? map['interests'] as List? ?? const []));
  Map<String, Object?> toMap() => {'userId': userId, 'university': university, 'academicLevel': academicLevel, 'gpa': gpa, 'skillIds': skillIds, 'interestIds': interestIds, 'updatedAt': FieldValue.serverTimestamp()};
  double get completion => [university, academicLevel, if (gpa != null) 'gpa', if (skillIds.isNotEmpty) 'skills', if (interestIds.isNotEmpty) 'interests'].length / 5;
}
