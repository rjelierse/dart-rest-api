import '../callflows/model/callflow.dart';
import '../calls/model/leg.dart';
import '../general/model/base_service.dart';
import '../webhooks/api_webhooks_service.dart';
import '../webhooks/model/webhook.dart';
import '../webhooks/webhooks_service.dart';
import 'calls_service.dart';
import 'model/call.dart';

/// API implementation of [CallsService].
class ApiCallsService extends BaseService implements CallsService {
  @override
  WebhooksService webhooks;

  /// Constructor.
  ApiCallsService(String accessKey, {int timeout, List<String> features})
      : webhooks = ApiWebhooksService(accessKey, BaseService.voiceEndpoint),
        super(accessKey, timeout: timeout, features: features);

  @override
  Future<Call> create(Call call, Callflow callflow, {Webhook webhook}) => post(
          '/calls',
          hostname: BaseService.voiceEndpoint,
          body: call.toMap()
            ..addAll({'callFlow': callflow.toMap()})
            ..addAll(webhook == null ? {} : {'webhook': webhook.toMap()}))
      .then((response) => Future.value(
          response?.body == null ? null : Call.fromJson(response.body)));

  @override
  Future<List<Call>> list() => get('/calls',
          hostname: BaseService.voiceEndpoint)
      .then((response) => Future.value(
          response?.body == null ? null : Call.fromJsonList(response.body)));

  @override
  Future<List<Leg>> listLegs(String callId) =>
      get('/calls/$callId/legs', hostname: BaseService.voiceEndpoint).then(
          (response) => Future.value(
              response?.body == null ? null : Leg.fromJsonList(response.body)));

  @override
  Future<Call> read(String id) =>
      get('/calls/$id', hostname: BaseService.voiceEndpoint).then((response) =>
          Future.value(
              response?.body == null ? null : Call.fromJson(response.body)));

  @override
  Future<Leg> readLeg(String callId, String legId) =>
      get('/calls/$callId/legs/$legId', hostname: BaseService.voiceEndpoint)
          .then((response) => Future.value(
              response?.body == null ? null : Leg.fromJson(response.body)));

  @override
  Future<void> remove(String id) =>
      delete('/calls/$id', hostname: BaseService.voiceEndpoint);
}
