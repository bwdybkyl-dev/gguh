# Smart Educational Advisor

Flutter + Firebase application foundation for student, advisor, and administrator flows. It uses Firebase Authentication, Firestore streams for real-time data/chat, Storage-ready attachment services, and Riverpod dependency injection.

## Setup
1. Run `flutterfire configure` to create platform configuration for your Firebase project.
2. Enable Email/Password authentication, Cloud Firestore, Storage, and Cloud Messaging.
3. Deploy `firestore.rules` and `storage.rules` after review.
4. Run `flutter pub get` then `flutter analyze`.

The collection contract is documented in [docs/firebase_schema.md](docs/firebase_schema.md).
