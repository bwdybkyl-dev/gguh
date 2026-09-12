import 'package:flutter_test/flutter_test.dart';
import 'package:smart_educational_advisor/data/models/student_model.dart';
import 'package:smart_educational_advisor/features/majors/data/major_model.dart';
import 'package:smart_educational_advisor/services/recommendation/recommendation_service.dart';
void main(){test('ranks a major supported by student skills and interests',(){const student=StudentModel(userId:'student',gpa:4.5,skillIds:['dart'],interestIds:['technology']);const major=MajorModel(id:'software',name:'هندسة البرمجيات',categoryId:'tech',description:'',requiredSkillIds:['dart'],interests:['technology'],careers:[]);final results=const RecommendationService().recommend(student:student,majors:[major]);expect(results.single.major.id,'software');expect(results.single.percentage,greaterThan(70));});}
