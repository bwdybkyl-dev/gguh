# Firebase data contract

All timestamps are Firestore `Timestamp`s and documents use their Firestore ID as the model ID.

| Collection | Primary fields | Access |
|---|---|---|
| `users` | name, email, phone, role, photoUrl, isActive, createdAt | Owner/admin |
| `students` | userId, university, college, department, academicLevel, gpa, skillIds, interests | Owner/admin |
| `advisors` | userId, specialization, experience, bio, approvalStatus | Public read; owner/admin write |
| `majors`, `skills`, categories | name, description, requirements, isActive | Signed-in read; admin write |
| `assessments`, `questions`, `answers`, `assessment_results` | assessmentId, studentId, scores, submittedAt | Participant/admin |
| `recommendations` | studentId, majorId, matchPercentage, reasons, missingSkillIds | Student/admin |
| `consultations`, `appointments`, `availability` | studentId, advisorId, status, schedule | Related users/admin |
| `conversations` | participantIds, consultationId, lastMessage, updatedAt | Participants only |
| `conversations/{id}/messages` | senderId, receiverId, text, type, attachment, replyToMessageId, reactions, status, isDeleted | Conversation participants |
| `notifications`, `calls`, `reports` | recipientId, type, payload, createdAt | Recipient/admin |

Deploy `firestore.rules` and `storage.rules` after reviewing organization-specific policies. Configure Firebase with `flutterfire configure`; no project credentials are committed.
