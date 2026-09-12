import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';
class NotificationRepository { NotificationRepository(this._db); final FirebaseFirestore _db; Stream<List<AppNotificationModel>> watchForUser(String userId)=>_db.collection('notifications').where('recipientId',isEqualTo:userId).orderBy('createdAt',descending:true).snapshots().map((snapshot)=>snapshot.docs.map(AppNotificationModel.fromFirestore).toList()); Future<void> markRead(String id)=>_db.collection('notifications').doc(id).update({'isRead':true}); }
