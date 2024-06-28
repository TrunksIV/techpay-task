import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' show Client, Response;

import '../constants/repository_constants.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpUtils {
  static Future<Response> get(
    Uri uri,
    Client client,
  ) async {
    var authHeaders = await authenticatedHeaders();
    var response = await client.get(
      uri,
      headers: authHeaders,
    );

    return response;
  }

  static Future<Response> post(
    Uri uri,
    Client client, {
    Map<String?, dynamic>? body,
  }) async {
    var authHeaders = await authenticatedHeaders();
    String? requestBody;

    if (body != null) {
      requestBody = jsonEncode(body);
    }

    var response = await client.post(
      uri,
      headers: authHeaders,
      body: requestBody,
    );

    return response;
  }

  static Future<Response> put(
    Uri uri,
    Client client, {
    Map<String?, dynamic>? body,
  }) async {
    var authHeaders = await authenticatedHeaders();
    String? requestBody;

    if (body != null) {
      requestBody = jsonEncode(body);
    }

    var response = await client.put(
      uri,
      headers: authHeaders,
      body: requestBody,
    );

    return response;
  }

  static Future<Response> putHeadlines(
    Uri uri,
    Client client, {
    String? body,
  }) async {
    var authHeaders = await authenticatedHeaders();
    String? requestBody;

    if (body != null) {
      requestBody = body;
    }

    var response = await client.put(
      uri,
      headers: authHeaders,
      body: requestBody,
    );

    return response;
  }

  static Future<Response> delete(
    Uri uri,
    Client client, {
    Map<String?, dynamic>? body,
  }) async {
    var authHeaders = await authenticatedHeaders();
    String? requestBody;

    if (body != null) {
      requestBody = jsonEncode(body);
    }

    var response = await client.delete(
      uri,
      headers: authHeaders,
      body: requestBody,
    );

    return response;
  }

  static Map<String, String> headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static Future<Map<String, String>> authenticatedHeaders() async {
    var token = dotenv.env['API_TOKEN'] ?? '';

    return {
      ...headers(),
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}
