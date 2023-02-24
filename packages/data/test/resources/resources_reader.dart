import 'dart:io';

String reader(String name) =>
    File('test/resources/$name.json').readAsStringSync();
