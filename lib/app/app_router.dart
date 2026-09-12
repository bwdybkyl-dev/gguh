import 'package:flutter/material.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/chat/presentation/chat_screen.dart';
import '../features/majors/presentation/majors_screen.dart';
import '../features/student/presentation/student_home_screen.dart';
import '../features/student/presentation/role_dashboard_screen.dart';
final appRouter=AppRouter();
class AppRouter { Route<dynamic> onGenerateRoute(RouteSettings settings){final Widget page=switch(settings.name){'/login'=>const LoginScreen(),'/register'=>const RegisterScreen(),'/forgot-password'=>const ForgotPasswordScreen(),'/student'=>const StudentHomeScreen(),'/advisor'=>const RoleDashboardScreen(title: 'لوحة المستشار'),'/admin'=>const RoleDashboardScreen(title: 'لوحة الإدارة'),'/majors'=>const MajorsScreen(),'/chat'=>ChatScreen(conversationId:settings.arguments as String? ?? 'general'),_=>const LoginScreen()};return MaterialPageRoute(settings:settings,builder:(_)=>page);} RouteFactory get generator=>onGenerateRoute; }
