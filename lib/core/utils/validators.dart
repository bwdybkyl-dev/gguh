abstract final class Validators {
  static String? required(String? value, {String label = 'الحقل'}) => value == null || value.trim().isEmpty ? '$label مطلوب' : null;
  static String? email(String? value) => value == null || !RegExp(r'^\S+@\S+\.\S+$').hasMatch(value) ? 'أدخل بريداً إلكترونياً صحيحاً' : null;
  static String? password(String? value) => value == null || value.length < 8 ? 'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل' : null;
}
