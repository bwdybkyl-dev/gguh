import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'app_router.dart';
import 'app_routes.dart';
class SmartEducationalAdvisorApp extends StatelessWidget { const SmartEducationalAdvisorApp({super.key}); @override Widget build(BuildContext context)=>MaterialApp(title:'المستشار التعليمي الذكي',debugShowCheckedModeBanner:false,theme:AppTheme.light,darkTheme:AppTheme.dark,themeMode:ThemeMode.system,initialRoute:AppRoutes.splash,onGenerateRoute:appRouter.onGenerateRoute,builder:(context,child)=>Directionality(textDirection:TextDirection.rtl,child:child ?? const SizedBox.shrink())); }
