import '../../../../core/constants/app_assets.dart';
import '../models/chat_conversation_model.dart';
import '../models/chat_message_model.dart';

abstract class ChatRepository {
  Future<List<ChatConversationModel>> getConversations({String? filter});
  Future<List<ChatMessageModel>> getMessagesForThread(String threadId);
  Future<ChatMessageModel> sendMessage({
    required String threadId,
    required String text,
  });
}

class MockChatRepository implements ChatRepository {
  static final List<ChatConversationModel> _conversations = [
    const ChatConversationModel(
      id: 'thread-aarav',
      creatorName: 'Aarav Sharma',
      niche: 'Streetwear',
      avatarUrl: AppAssets.aaravSharma,
      campaignTag: 'Campaign: Sneaker Gen-2 Drop',
      lastMessage:
          'Just sent over the draft reel for the summer collection! Let me know if...',
      timestamp: '2m ago',
      unreadCount: 2,
      attachmentName: 'Draft Reel v1.mp4',
      attachmentType: 'video',
      category: 'unread deals',
    ),
    const ChatConversationModel(
      id: 'thread-riya',
      creatorName: 'Riya Sen',
      niche: 'Luxury Fashion',
      avatarUrl: AppAssets.riyaSen,
      campaignTag: 'Agreement Ready',
      dealAmount: '\$4,200',
      lastMessage: 'Contract signed. Ready to proceed with escrow release.',
      timestamp: '14m ago',
      hasUnreadDot: true,
      attachmentName: 'Awaiting your signature',
      attachmentType: 'contract',
      category: 'unread deals negotiations',
    ),
    const ChatConversationModel(
      id: 'thread-kabir',
      creatorName: 'Kabir Mehta',
      niche: 'Fitness',
      avatarUrl: AppAssets.kabirMehta,
      campaignTag: 'Active Milestone',
      lastMessage: 'Hey team, can we adjust the delivery date to Thursday?',
      timestamp: '2h ago',
      deliveryStatus: 'delivered',
      attachmentName: 'Delivery: Thu, 4:00 PM',
      attachmentType: 'event',
      category: 'deals negotiations',
    ),
    const ChatConversationModel(
      id: 'thread-ananya',
      creatorName: 'Ananya Verma',
      niche: 'Tech & Gadgets',
      avatarUrl: AppAssets.ananyaVerma,
      campaignTag: 'Escrow Locked',
      dealAmount: '\$1,850',
      lastMessage: 'Payment milestone received! Beginning video production.',
      timestamp: 'Yesterday',
      deliveryStatus: 'delivered',
      attachmentName: 'Script review approved',
      attachmentType: 'milestone',
      category: 'deals',
    ),
    const ChatConversationModel(
      id: 'thread-zoya',
      creatorName: 'Zoya Akhtar',
      niche: 'Travel Vlogs',
      avatarUrl: AppAssets.zoyaAkhtar,
      campaignTag: 'Briefing Sent',
      lastMessage: 'Thank you for the briefing deck. Will review tonight.',
      timestamp: '2d ago',
      deliveryStatus: 'sent',
      attachmentName: 'Campaign_Brief_Q3.pdf',
      attachmentType: 'brief',
      category: 'deals',
    ),
  ];

  static final List<ChatMessageModel> _aaravMessages = [
    const ChatMessageModel(
      id: 'm1',
      text:
          'Hey UrbanKicks team! I just wrapped up the draft reel showcasing the Sneaker Gen-2 in street setting. Really love the silhouette! 👟✨',
      timestamp: '10:24 AM',
      sender: MessageSender.creator,
      type: MessageType.text,
    ),
    const ChatMessageModel(
      id: 'm2',
      text: '',
      timestamp: '10:25 AM',
      sender: MessageSender.creator,
      type: MessageType.videoAttachment,
      videoThumbnailUrl: AppAssets.reelVideoThumbnail,
      videoDuration: '0:42 • 4K 60fps',
      videoBadge: 'Draft v1',
      videoFileName: 'Draft_Reel_v1.mp4',
      videoFileSize: '48 MB • Ready for review',
    ),
    const ChatMessageModel(
      id: 'm3',
      text:
          'This looks fantastic Aarav! The color grading is on point with our brand book. Let\'s move forward with posting on Friday 6 PM. 🔥',
      timestamp: '10:32 AM',
      sender: MessageSender.brand,
      type: MessageType.text,
      isDelivered: true,
    ),
    const ChatMessageModel(
      id: 'm4',
      text:
          'Awesome! Could you please sign off on the deliverables checklist and release the escrow milestone?',
      timestamp: '10:35 AM',
      sender: MessageSender.creator,
      type: MessageType.text,
    ),
  ];

  @override
  Future<List<ChatConversationModel>> getConversations({String? filter}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (filter == null || filter == 'all') {
      return List.from(_conversations);
    }
    return _conversations
        .where((c) => c.category.contains(filter.toLowerCase()))
        .toList();
  }

  @override
  Future<List<ChatMessageModel>> getMessagesForThread(String threadId) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return List.from(_aaravMessages);
  }

  @override
  Future<ChatMessageModel> sendMessage({
    required String threadId,
    required String text,
  }) async {
    final newMsg = ChatMessageModel(
      id: 'm_${DateTime.now().millisecondsSinceEpoch}',
      text: text,
      timestamp: 'Just now',
      sender: MessageSender.brand,
      type: MessageType.text,
      isDelivered: true,
    );
    _aaravMessages.add(newMsg);
    return newMsg;
  }
}
