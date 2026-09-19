import '../models/creator_conversation_model.dart';
import '../models/mock_creator_conversations.dart';

abstract class CreatorMessagesRepository {
  Future<List<CreatorConversationModel>> getConversations();
}

class MockCreatorMessagesRepository implements CreatorMessagesRepository {
  @override
  Future<List<CreatorConversationModel>> getConversations() async {
    return mockCreatorConversations;
  }
}
