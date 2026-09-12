import 'package:flutter/material.dart';
import '../features/admin/presentation/admin_dashboard_screen.dart';
import '../features/advisor/presentation/advisor_dashboard_screen.dart';
import '../features/assessments/presentation/assessment_list_screen.dart';
import '../features/auth/presentation/forgot_password_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/chat/presentation/chat_screen.dart';
import '../features/consultations/presentation/consultations_screen.dart';
import '../features/majors/presentation/majors_screen.dart';
import '../features/recommendations/presentation/recommendations_screen.dart';
import '../features/splash/presentation/splash_screen.dart';
import '../features/student/presentation/student_home_screen.dart';
import 'app_routes.dart';
final appRouter=AppRouter();
class AppRouter { Route<dynamic> onGenerateRoute(RouteSettings settings) { final page=switch(settings.name) { AppRoutes.splash=>const SplashScreen(),AppRoutes.login=>const LoginScreen(),AppRoutes.register=>const RegisterScreen(),AppRoutes.forgotPassword=>const ForgotPasswordScreen(),AppRoutes.student=>const StudentHomeScreen(),AppRoutes.advisor=>const AdvisorDashboardScreen(),AppRoutes.admin=>const AdminDashboardScreen(),AppRoutes.majors=>const MajorsScreen(),AppRoutes.assessments=>const AssessmentListScreen(),AppRoutes.recommendations=>const RecommendationsScreen(),AppRoutes.consultations=>const ConsultationsScreen(),AppRoutes.chat=>ChatScreen(conversationId:settings.arguments as String? ?? ''),_=>const LoginScreen()}; return MaterialPageRoute(settings:settings,builder:(_)=>page); } }
