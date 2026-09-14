import '../models/inbox_filter.dart';
import '../models/message_thread_model.dart';

export '../models/inbox_filter.dart';

/// Business logic helper to filter threads by search term and tab category.
abstract final class InboxThreadsFilter {
  static List<MessageThreadModel> filter({
    required List<MessageThreadModel> threads,
    required String query,
    required InboxFilter filter,
  }) {
    return threads.where((t) {
      if (query.isNotEmpty) {
        final q = query.toLowerCase();
        final matches = t.brandName.toLowerCase().contains(q) ||
            t.campaignName.toLowerCase().contains(q) ||
            t.contactName.toLowerCase().contains(q) ||
            t.lastMessage.toLowerCase().contains(q);
        if (!matches) return false;
      }
      if (filter == InboxFilter.activeDeals) return t.isDeal;
      if (filter == InboxFilter.inquiries) return !t.isDeal;
      if (filter == InboxFilter.archived) return false;
      return true;
    }).toList();
  }
}
