import 'package:cloud_firestore/cloud_firestore.dart';

class AssessmentModel {
  const AssessmentModel({required this.id, required this.title, required this.description, this.isActive = true, this.questionCount = 0});
  final String id, title, description;
  final bool isActive;
  final int questionCount;
  factory AssessmentModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) => AssessmentModel.fromMap(doc.id, doc.data() ?? const {});
  factory AssessmentModel.fromMap(String id, Map<String, dynamic> map) => AssessmentModel(id: id, title: map['title'] as String? ?? '', description: map['description'] as String? ?? '', isActive: map['isActive'] as bool? ?? true, questionCount: (map['questionCount'] as num?)?.toInt() ?? 0);
  Map<String, Object?> toMap() => {'title': title, 'description': description, 'isActive': isActive, 'questionCount': questionCount, 'updatedAt': FieldValue.serverTimestamp()};
}
