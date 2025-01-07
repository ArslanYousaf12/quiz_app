import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/app.dart';

class AppBootstrap {
  /// Create the root widget that should be passed to [runApp].
  Widget createRootWidget() {
    return const MyApp();
  }

  // Register Flutter error handlers
  void registerErrorHandlers(errorLogger) {
    // * Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      errorLogger.logError(details.exception, details.stack);
    };
    // * Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.logError(error, stack);
      return true;
    };
    // * Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }
}
