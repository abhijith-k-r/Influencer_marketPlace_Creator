import 'package:equatable/equatable.dart';
import '../data/models/campaign_filter_model.dart';
import '../data/models/campaign_model.dart';

abstract class CampaignEvent extends Equatable {
  const CampaignEvent();

  @override
  List<Object?> get props => [];
}

class LoadCampaignsEvent extends CampaignEvent {
  const LoadCampaignsEvent();
}

class SelectCampaignEvent extends CampaignEvent {
  final CampaignModel campaign;

  const SelectCampaignEvent(this.campaign);

  @override
  List<Object?> get props => [campaign];
}

class SearchCampaignsEvent extends CampaignEvent {
  final String query;

  const SearchCampaignsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class ChangeStatusTabEvent extends CampaignEvent {
  final String tab;

  const ChangeStatusTabEvent(this.tab);

  @override
  List<Object?> get props => [tab];
}

class ApplyFilterEvent extends CampaignEvent {
  final CampaignFilterModel filter;

  const ApplyFilterEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}

class ResetFilterEvent extends CampaignEvent {
  const ResetFilterEvent();
}

class CreateCampaignEvent extends CampaignEvent {
  final CampaignModel campaign;

  const CreateCampaignEvent(this.campaign);

  @override
  List<Object?> get props => [campaign];
}

class DeleteCampaignEvent extends CampaignEvent {
  final String campaignId;

  const DeleteCampaignEvent(this.campaignId);

  @override
  List<Object?> get props => [campaignId];
}
