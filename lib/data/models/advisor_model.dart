import 'package:cloud_firestore/cloud_firestore.dart';

enum AdvisorApprovalStatus { pending, approved, rejected, suspended }

class AdvisorModel {
  const AdvisorModel({required this.userId, this.specialization = '', this.yearsOfExperience = 0, this.bio = '', this.status = AdvisorApprovalStatus.pending, this.isAvailable = false, this.rating = 0, this.consultationCount = 0});
  final String userId, specialization, bio;
  final int yearsOfExperience, consultationCount;
  final AdvisorApprovalStatus status;
  final bool isAvailable;
  final double rating;
  factory AdvisorModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) => AdvisorModel.fromMap(doc.id, doc.data() ?? const {});
  factory AdvisorModel.fromMap(String id, Map<String, dynamic> map) => AdvisorModel(userId: id, specialization: map['specialization'] as String? ?? '', yearsOfExperience: (map['yearsOfExperience'] as num?)?.toInt() ?? 0, bio: map['bio'] as String? ?? '', status: AdvisorApprovalStatus.values.firstWhere((item) => item.name == map['approvalStatus'], orElse: () => AdvisorApprovalStatus.pending), isAvailable: map['isAvailable'] as bool? ?? false, rating: (map['rating'] as num?)?.toDouble() ?? 0, consultationCount: (map['consultationCount'] as num?)?.toInt() ?? 0);
  Map<String, Object?> toMap() => {'userId': userId, 'specialization': specialization, 'yearsOfExperience': yearsOfExperience, 'bio': bio, 'approvalStatus': status.name, 'isAvailable': isAvailable, 'rating': rating, 'consultationCount': consultationCount, 'updatedAt': FieldValue.serverTimestamp()};
}
