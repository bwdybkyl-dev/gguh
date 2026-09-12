# مخطط Firestore

## المجموعات الأساسية

| المجموعة | المفتاح والعلاقات | أهم الحقول |
|---|---|---|
| `users/{uid}` | مصدر الدور والحساب | `name`, `email`, `role`, `isActive`, `photoUrl`, `lastSeenAt` |
| `students/{uid}` | امتداد لـ`users` | `university`, `academicLevel`, `gpa`, `skillIds`, `interestIds` |
| `advisors/{uid}` | امتداد لـ`users` | `specialization`, `approvalStatus`, `rating`, `isAvailable` |
| `majors/{id}` | مرجع من التوصيات | `name`, `requiredSkillIds`, `interests`, `careers`, `isActive` |
| `assessments/{id}/questions/{id}` | اختبار database-driven | `text`, `order`, `options[{id,text,scores}]` |
| `assessment_results/{id}` | طالب واختبار | `studentId`, `assessmentId`, `answers`, `scores`, `submittedAt` |
| `recommendations/{id}` | طالب وتخصص | `studentId`, `majorId`, `matchPercentage`, `reasons`, `strengths`, `weaknesses` |
| `consultations/{id}` | طالب ومستشار ومحادثة | `studentId`, `advisorId`, `status`, `conversationId`, `rating` |
| `appointments/{id}` | طالب ومستشار | `startsAt`, `endsAt`, `status`, `consultationId` |
| `conversations/{id}` | المشاركون والاستشارة | `participantIds`, `lastMessage`, `unreadCounts`, `typingUserIds`, `updatedAt` |
| `conversations/{id}/messages/{id}` | رسالة آنية | `senderId`, `type`, `text`, `attachment`, `replyToMessageId`, `status` |
| `conversations/{id}/messages/{id}/reactions/{uid}` | تفاعل واحد للمستخدم | `userId`, `emoji`, `createdAt` |
| `notifications/{id}` | إشعار داخل التطبيق | `recipientId`, `type`, `title`, `body`, `data`, `isRead` |
| `calls/{id}` | lifecycle فقط | `conversationId`, `callerId`, `recipientId`, `status`, `providerRoomId` |

## العمليات الآمنة

- التسجيل ينشئ حساب Auth ثم مستندي `users` و`students` أو `advisors` في Batch.
- يختار الطالب موعداً متاحاً عبر معاملة Firestore في طبقة المستودع لمنع الحجز المزدوج.
- قبول الاستشارة يربطها بمحادثة تضم الطالب والمستشار فقط.
- ترسل الدالة السحابية عند إنشاء رسالة إشعاراً محفوظاً في Firestore؛ يرسل FCM من خادم موثوق وفق مفاتيح وتهيئة المشروع.
