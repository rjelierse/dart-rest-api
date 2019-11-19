import 'package:http/http.dart' show Response;

import '../base_service.dart';
import 'hlr_service.dart';

/// API implementation of hlr service.
class ApiHlrService extends BaseService implements HlrService {
  /// Constructor.
  ApiHlrService(String accessKey, {int timeout, List<String> features})
      : super(accessKey, timeout: timeout, features: features);

  @override
  Future<Response> create(int msdisdn, {String ref}) =>
      post('/hlr', body: {'msisdn': msdisdn, 'reference': ref});

  @override
  Future<Response> read(String id) => get('/hlr/$id');
}