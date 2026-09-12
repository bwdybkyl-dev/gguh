import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/assessment_model.dart';
class AssessmentRepository { AssessmentRepository(this._db); final FirebaseFirestore _db; Stream<List<AssessmentModel>> watchActive() => _db.collection('assessments').where('isActive',isEqualTo:true).snapshots().map((snapshot)=>snapshot.docs.map(AssessmentModel.fromFirestore).toList()); }
