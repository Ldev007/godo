abstract class BaseApiClient {
  Future<Map<String, dynamic>> get(String endpoint);
  Future<Map<String, dynamic>> post(String endpoint, {Map<String, dynamic>? body});
  Future<Map<String, dynamic>> put(String endpoint, {Map<String, dynamic>? body});
  Future<void> delete(String endpoint);
}
