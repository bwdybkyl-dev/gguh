import 'package:cloud_firestore/cloud_firestore.dart';
import 'major_model.dart';
class MajorRepository { MajorRepository(this.db); final FirebaseFirestore db; Stream<List<MajorModel>> watchMajors()=>db.collection('majors').where('isActive',isEqualTo:true).snapshots().map((snapshot)=>snapshot.docs.map((doc)=>MajorModel.fromMap(doc.id,doc.data())).toList()); Future<void> save(MajorModel major)=>db.collection('majors').doc(major.id).set(major.toMap(),SetOptions(merge:true)); Future<void> delete(String id)=>db.collection('majors').doc(id).delete(); }
