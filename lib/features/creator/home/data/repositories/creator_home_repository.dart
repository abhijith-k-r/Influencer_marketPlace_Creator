import '../models/creator_opportunity_model.dart';
import '../models/mock_creator_opportunities.dart';

abstract class CreatorHomeRepository {
  Future<List<CreatorOpportunityModel>> getOpportunities();
}

class MockCreatorHomeRepository implements CreatorHomeRepository {
  @override
  Future<List<CreatorOpportunityModel>> getOpportunities() async {
    return mockCreatorOpportunities;
  }
}
