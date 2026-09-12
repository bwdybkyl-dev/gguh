import * as admin from 'firebase-admin';
import { onDocumentCreated } from 'firebase-functions/v2/firestore';

admin.initializeApp();
const db = admin.firestore();

export const notifyConversationParticipants = onDocumentCreated(
  'conversations/{conversationId}/messages/{messageId}',
  async (event) => {
    const message = event.data?.data();
    if (!message) return;
    const conversation = await db.doc(`conversations/${event.params.conversationId}`).get();
    const participantIds = (conversation.data()?.participantIds as string[] | undefined) ?? [];
    const recipients = participantIds.filter((id) => id !== message.senderId);
    await Promise.all(recipients.map(async (recipientId) => {
      await db.collection('notifications').add({
        recipientId,
        title: 'رسالة جديدة',
        body: message.type === 'text' ? message.text : 'أرسل لك مرفقاً جديداً',
        type: 'new_message',
        data: { conversationId: event.params.conversationId },
        isRead: false,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });
    }));
  },
);
