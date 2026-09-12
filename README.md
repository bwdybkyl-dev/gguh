# المستشار التعليمي الذكي

تطبيق Flutter عربي (RTL) لإدارة الإرشاد الأكاديمي للطلاب والمستشارين والإدارة. يعتمد التطبيق على **Firebase Authentication** و**Cloud Firestore** و**Storage** و**Cloud Messaging** مع Riverpod، ولا تُنفذ استعلامات Firebase داخل الواجهات.

## البنية

```text
UI → Riverpod Controller/Provider → Repository → Firebase service/data source → Firebase
```

- `lib/data/models`: نماذج مستقلة للطلاب، المستشارين، الاختبارات، الاستشارات، المواعيد، التوصيات، الإشعارات، والاتصال والمحادثة.
- `lib/data/repositories`: بوابات Firestore القابلة للاختبار.
- `lib/services`: منطق النتائج والتوصية والتكاملات.
- `lib/features`: شاشات مستقلة حسب المجال والدور.
- `functions`: وظائف Cloud Functions لإشعارات أحداث الرسائل.
- `firestore.rules` و`storage.rules`: سياسة وصول role-based.

## إعداد Firebase

1. ثبّت Firebase CLI وFlutterFire CLI ثم نفّذ `flutterfire configure` من جذر المشروع لإنشاء `lib/firebase/firebase_options.dart` الخاصة بمشروعك. لا تضع مفاتيح أو حسابات خدمة في المستودع.
2. فعّل Email/Password في Firebase Authentication، وFirestore وStorage وCloud Messaging.
3. نفّذ `flutter pub get` ثم `flutter run`.
4. انشر القواعد والفهارس والدوال: `firebase deploy --only firestore:rules,firestore:indexes,storage,functions`.
5. شغّل `cd functions && npm install && npm run build` قبل النشر الأول للدوال.

## مخطط البيانات

المخطط، العلاقات، وأنماط الوصول موثقة في [docs/firebase_schema.md](docs/firebase_schema.md). جميع بيانات الإنتاج تأتي من Firestore؛ يمكن إدخال بيانات أولية من لوحة الإدارة أو عبر Firebase Console فقط.

## الاتصال

يحفظ التطبيق lifecycle المكالمة في `calls`. يحتاج نقل الصوت/الفيديو الفعلي إلى مزود WebRTC أو SDK مختار وإعدادات مشروعه؛ لا توجد واجهة تدّعي إجراء مكالمة دون قناة اتصال مهيأة.
