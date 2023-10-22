import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'callbacks.dart';

const String _baseUrl = 'https://api.escuelajs.co/api/v1';

const String argKeyUrl = 'url';
const String argKeyParams = 'params';
const String argKeySuccessCode = 'success_code';

const Duration mRequestTimeout = Duration(seconds: 60);

Future<RequestStatus> _makeGetRequest(Map<String, dynamic> args) async {
  String url = args[argKeyUrl] as String;
  StringBuffer stringBuffer = StringBuffer();
  stringBuffer.write('\n\n');
  stringBuffer.write('Get request data as following: \n');
  stringBuffer.write('url: $url\n');
  try {
    http.Response response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(mRequestTimeout, onTimeout: () {
      stringBuffer.write('ended with Timeout Exception');
      stringBuffer.write('\n\n');
      if (kDebugMode) {
        print(stringBuffer.toString());
      }
      return http.Response('Please check your internet connection', 404);
    });
    stringBuffer.write('responseCode: ${response.statusCode}\n');
    stringBuffer.write('responseBody: ${response.body}\n');
    stringBuffer.write('\n\n');
    if (kDebugMode) {
      print(stringBuffer.toString());
    }
    if (response.statusCode != 200) {
      return RequestStatus.failure(json.decode(response.body)['message']);
    }
    return RequestStatus.success(json.decode(utf8.decode(response.bodyBytes)));
  } on Exception catch (e) {
    stringBuffer.write('ended with unknown exception');
    stringBuffer.write('\n\n');
    if (kDebugMode) {
      print(stringBuffer.toString());
    }
    if (kDebugMode) {
      print(e);
    }
    return RequestStatus.failure('Something went wrong!');
  }
}

Future<RequestStatus> _get(Map<String, dynamic> args) async {
  return await _makeGetRequest(args);
}

Future<RequestStatus> _makePostRequest(Map<String, dynamic> args) async {
  String url = args[argKeyUrl] as String;
  Map<String, dynamic> params = args[argKeyParams] as Map<String, dynamic>;
  int successCode = args[argKeySuccessCode] ?? 201;
  StringBuffer stringBuffer = StringBuffer();
  stringBuffer.write('\n\n');
  stringBuffer.write('Post request data as following: \n');
  stringBuffer.write('url: $url\n');
  stringBuffer.write('postData: ${json.encode(params)}\n');

  print('URL: $url');
  print('Params: ${json.encode(params)}');

  try {
    http.Response response = await http.post(
        Uri.parse(url),
        body: json.encode(params),
        headers: {
          "Content-Type":"application/json; charset=utf-8"
        }
    )
        .timeout(mRequestTimeout, onTimeout: () {
      stringBuffer.write('ended with Timeout Exception');
      stringBuffer.write('\n\n');
      if (kDebugMode) {
        print(stringBuffer.toString());
      }
      return http.Response('Please check your internet connection', 404);
    });
    stringBuffer.write('responseCode: ${response.statusCode}\n');
    stringBuffer.write('responseBody: ${response.body}\n');
    stringBuffer.write('\n\n');
    if (kDebugMode) {
      print(stringBuffer.toString());
    }
    if (response.statusCode != successCode) {
      return RequestStatus.failure(json.decode(response.body)['message']);
    }
    return RequestStatus.success(json.decode(utf8.decode(response.bodyBytes)));
  } on Exception catch (e) {
    stringBuffer.write('ended with unknown $e exception');
    stringBuffer.write('\n\n');
    if (kDebugMode) {
      print(stringBuffer.toString());
    }
    return RequestStatus.failure('Something went wrong!');
  }
}

Future<RequestStatus> _post(Map<String, dynamic> args) async {
  return await _makePostRequest(args);
}

Future<RequestStatus> _makePutRequest(Map<String, dynamic> args) async {
  String url = args[argKeyUrl] as String;
  Map<String, dynamic> params = args[argKeyParams] as Map<String, dynamic>;
  int successCode = args[argKeySuccessCode] ?? 200;
  StringBuffer stringBuffer = StringBuffer();
  stringBuffer.write('\n\n');
  stringBuffer.write('Put request data as following: \n');
  stringBuffer.write('url: $url\n');
  stringBuffer.write('putData: ${json.encode(params)}');
  try {
    http.Response response = await http
        .put(
        Uri.parse(url),
        body: json.encode(params),
        headers: {
          "Content-Type":"application/json; charset=utf-8"
        }
    )
        .timeout(mRequestTimeout, onTimeout: () {
      stringBuffer.write('ended with Timeout Exception');
      stringBuffer.write('\n\n');
      if (kDebugMode) {
        print(stringBuffer.toString());
      }
      return http.Response('Please check your internet connection', 404);
    });
    stringBuffer.write('responseCode: ${response.statusCode}\n');
    stringBuffer.write('responseBody: ${response.body}\n');
    stringBuffer.write('\n\n');
    if (kDebugMode) {
      print(stringBuffer.toString());
    }
    if (response.statusCode != successCode) {
      return RequestStatus.failure(json.decode(response.body)['message']);
    }
    return RequestStatus.success(json.decode(utf8.decode(response.bodyBytes)));
  } on Exception catch (e) {
    stringBuffer.write('ended with unknown exception');
    stringBuffer.write('\n\n');
    if (kDebugMode) {
      print(stringBuffer.toString());
    }
    if (kDebugMode) {
      print(e);
    }
    return RequestStatus.failure('Something went wrong!');
  }
}

Future<RequestStatus> _put(Map<String, dynamic> args) async {
  return await _makePutRequest(args);
}

Future<RequestStatus> getAllProducts() async => await _get({
  argKeyUrl: '$_baseUrl/products',
});

