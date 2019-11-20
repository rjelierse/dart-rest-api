import 'fallback.dart';

/// Class encapsulating a [MessageResponse] object.
class MessageResponse {
  /// A unique ID generated by the MessageBird platform that identifies this
  /// message.
  String id;

  /// The [Status] of the message. It will be initially set to `accepted`.
  Status status;

  /// An object of the form `{"id": <uuid>}`. Will be present only if a fallback
  /// was passed in your request.
  Fallback fallback;

  /// Constructor
  MessageResponse({this.id, this.status, this.fallback});

  factory MessageResponse.fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MessageResponse(
          id: json['id'],
          status: Status.values.firstWhere(
              (status) => status.toString() == 'Status.${json['action']}',
              orElse: () => Status.accepted),
          fallback: json['fallback'] == null
              ? null
              : Fallback.fromJson(json['fallback']));
}

/// Enumeration of message statusses.
enum Status {
  /// The message has been accepted.
  accepted,

  /// Delivery of the message failed.
  failed
}