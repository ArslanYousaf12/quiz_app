import 'package:flutter/material.dart';
import 'package:quiz_app/app_bootstrap.dart';

void main() {
  final appBootstrap = AppBootstrap();
  // * uncomment this to connect to the Firebase emulators

  //TODO: await appBootstrap.setupEmulators();
  //TODO:  Stripe setup

  // use the container above to create the root widget
  final root = appBootstrap.createRootWidget();
  // start the app
  runApp(root);
}
