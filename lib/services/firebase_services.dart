import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
class AuthService { AuthService(this._auth); final FirebaseAuth _auth; Stream<User?> get changes=>_auth.authStateChanges(); Future<UserCredential> signIn(String email,String password)=>_auth.signInWithEmailAndPassword(email:email,password:password); Future<UserCredential> register(String email,String password)=>_auth.createUserWithEmailAndPassword(email:email,password:password); Future<void> resetPassword(String email)=>_auth.sendPasswordResetEmail(email:email); Future<void> signOut()=>_auth.signOut(); }
class FirestoreService { FirestoreService(this.db); final FirebaseFirestore db; CollectionReference<Map<String,dynamic>> collection(String path)=>db.collection(path); }
class StorageService { StorageService(this._storage); final FirebaseStorage _storage; Future<String> uploadBytes({required String path,required Uint8List bytes,required String contentType}) async { final ref=_storage.ref(path); await ref.putData(bytes,SettableMetadata(contentType:contentType)); return ref.getDownloadURL(); } }
class NotificationService { NotificationService(this._messaging); final FirebaseMessaging _messaging; Future<String?> requestToken() async { await _messaging.requestPermission(); return _messaging.getToken(); } }
