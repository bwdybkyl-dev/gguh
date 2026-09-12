import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/app_routes.dart';
import '../../../app/providers.dart';
class SplashScreen extends ConsumerWidget { const SplashScreen({super.key}); @override Widget build(BuildContext context,WidgetRef ref) { ref.listen(currentUserProvider,(_,next){next.whenData((user){if(user==null){Navigator.pushReplacementNamed(context,AppRoutes.login);} else {Navigator.pushReplacementNamed(context,'/${user.role.name}');}});}); return const Scaffold(body:Center(child:Column(mainAxisSize:MainAxisSize.min,children:[Icon(Icons.school_rounded,size:84),SizedBox(height:16),Text('المستشار التعليمي الذكي',style:TextStyle(fontSize:24,fontWeight:FontWeight.bold)),SizedBox(height:24),CircularProgressIndicator()] ))); } }
