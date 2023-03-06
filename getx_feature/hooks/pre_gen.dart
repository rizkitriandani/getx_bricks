import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

void run(HookContext context) async {
  context.logger.info('Running pre_gen.dart');
  final name = context.vars['name'] as String;

  final featuresDirectory = Directory(path.join(
    Directory.current.path,
    'lib',
    'features',
  ));

  if (featuresDirectory.existsSync()) {
    final brick = Brick.git(GitPath(
        'https://github.com/rizkitriandani/getx_bricks.git',
        path: 'getx_feature'));
    final generator = await MasonGenerator.fromBrick(brick);
    final target = DirectoryGeneratorTarget(featuresDirectory);
    var vars = <String, dynamic>{'name': name};
    await generator.hooks.preGen(vars: vars, onVarsChanged: (v) => vars = v);
    final files = await generator.generate(target,
        vars: vars,
        logger: context.logger,
        fileConflictResolution: FileConflictResolution.prompt);
  } else {
    final brick = Brick.git(GitPath(
        'https://github.com/rizkitriandani/getx_bricks.git',
        path: 'getx_feature'));
    final generator = await MasonGenerator.fromBrick(brick);
    final target = DirectoryGeneratorTarget(featuresDirectory);
    var vars = <String, dynamic>{'name': name};
    await generator.hooks.preGen(vars: vars, onVarsChanged: (v) => vars = v);
    final files = await generator.generate(target,
        vars: vars,
        logger: context.logger,
        fileConflictResolution: FileConflictResolution.prompt);
  }
}
