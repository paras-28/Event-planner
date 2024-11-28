import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

enum DebugType {
  error,
  info,
  url,
  response,
  statusCode,
  requestModel,
  longInfo,
  parsed
}

debuggerAdvance(
    {required String tag,
      required dynamic value,
      DebugType type = DebugType.info}) {
  switch (type) {
    case DebugType.statusCode:
      {
        debugPrint('\x1B[33m${"💎\u001b[1m STATUS CODE $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.info:
      {
        debugPrint('\x1B[32m${"⚡ INFO $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.error:
      {
        debugPrint('\x1B[31m${"🚨 ERROR $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.requestModel:
      {
        log("🌻 request Model $tag: $value");
        break;
      }
    case DebugType.longInfo:
      {
        log("🚕 long Info $tag:\n$value");
        break;
      }
    case DebugType.url:
      {
        debugPrint('\x1B[34m${"📌 URL $tag: $value"}\x1B[0m');
        break;
      }
    case DebugType.response:
      {
        /*       JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(value);
  log("🐘 Response Model $tag:\n$prettyprint");*/
        break;
      }
    case DebugType.parsed:
      {
        debugPrint('\x1B[34m${"📌 Parsed $tag: "}\x1B[0m');
        break;
      }
  }
}

printAPIRes({
  required String tag,
  required dynamic response,
  required dynamic statusCode,
  dynamic url,
}) {
  debugPrint('\x1B[34m${"📌 URL $tag: $url"}\x1B[0m');
  debugPrint('\x1B[33m${"💎\u001b[1m STATUS CODE $tag: $statusCode"}\x1B[0m');

  try {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(response);
    log("🐘 Response Model $tag:\n$prettyprint");
  } catch (e) {
    log("🐘 Response Model $tag:\n$response");
    log(e.toString(), name: "ERROR");
  }
}

printRequestModel(
    {required String tag,
      required dynamic requestModel,
      DebugType debugType = DebugType.info}) {
  debugPrint('\x1B[35m${"⚓ Request Model $tag: "}\x1B[0m');
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(requestModel);
  log("🐓 Request Model  $tag:\n$prettyprint");
}

prettyPrintJson({
  required String tag,
  required dynamic response,
}) {
  try {
    debugPrint('\x1B[35m${"⚓ Response Model $tag: "}\x1B[0m');
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(response);
    log("🧧  Model  $tag:\n$prettyprint");
  } catch (e) {
    log("🧧 Response Model $tag:\n$response");
    log(e.toString(), name: "ERROR");
  }
}

/*
*   debugPrint("\u001b[1m BOLD \u001b[0m\u001b[4m Underline \u001b[0m\u001b[7m Reversed \u001b[0m");
*
* */