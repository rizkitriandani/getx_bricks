import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  // Run `flutter packages get` after generation.
  await Process.run('flutter', ['pub', 'add', 'get']);
  await Process.run('flutter', ['pub', 'add', 'logger']);
  await Process.run('flutter', ['pub', 'add', 'dartz']);

  progress.complete();
}
