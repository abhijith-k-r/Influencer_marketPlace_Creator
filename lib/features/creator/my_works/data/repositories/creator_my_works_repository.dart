import '../models/creator_work_item.dart';
import '../models/creator_work_deliverable.dart';
import '../models/creator_work_milestone.dart';
import '../models/mock_creator_works_data.dart';
import '../models/mock_creator_work_details_data.dart';

abstract class CreatorMyWorksRepository {
  Future<List<CreatorWorkItem>> getWorks();
  Future<List<CreatorWorkDeliverable>> getDeliverables();
  Future<List<CreatorWorkMilestone>> getMilestones();
}

class MockCreatorMyWorksRepository implements CreatorMyWorksRepository {
  @override
  Future<List<CreatorWorkItem>> getWorks() async {
    return MockCreatorWorksData.items;
  }

  @override
  Future<List<CreatorWorkDeliverable>> getDeliverables() async {
    return MockCreatorWorkDetailsData.deliverables;
  }

  @override
  Future<List<CreatorWorkMilestone>> getMilestones() async {
    return MockCreatorWorkDetailsData.milestones;
  }
}
