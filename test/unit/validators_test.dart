import 'package:flutter_test/flutter_test.dart';import 'package:smart_educational_advisor/core/utils/validators.dart';
void main(){test('validates email and password in Arabic',(){expect(Validators.email('invalid'),isNotNull);expect(Validators.email('student@example.com'),isNull);expect(Validators.password('short'),isNotNull);expect(Validators.password('secure-pass'),isNull);});}
