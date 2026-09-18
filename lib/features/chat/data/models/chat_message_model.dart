import 'package:equatable/equatable.dart';

enum MessageSender { creator, brand }

enum MessageType { text, videoAttachment }

class ChatMessageModel extends Equatable {
  final String id;
  final String text;
  final String timestamp;
  final MessageSender sender;
  final MessageType type;
  final String? videoThumbnailUrl;
  final String? videoDuration;
  final String? videoFileName;
  final String? videoFileSize;
  final String? videoBadge;
  final bool isDelivered;

  const ChatMessageModel({
    required this.id,
    required this.text,
    required this.timestamp,
    required this.sender,
    this.type = MessageType.text,
    this.videoThumbnailUrl,
    this.videoDuration,
    this.videoFileName,
    this.videoFileSize,
    this.videoBadge,
    this.isDelivered = true,
  });

  bool get isOutgoing => sender == MessageSender.brand;

  @override
  List<Object?> get props => [
        id,
        text,
        timestamp,
        sender,
        type,
        videoThumbnailUrl,
        videoDuration,
        videoFileName,
        videoFileSize,
        videoBadge,
        isDelivered,
      ];
}
