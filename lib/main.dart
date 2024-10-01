import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'src/app/app.dart';
import 'src/app/app_entity.dart';
import 'src/app/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  FlutterSecureStorage secureStorage = FlutterSecureStorage();

  await di.init();
  AppEntity.uid = await secureStorage.read(key: "uid");
  runApp(BloodApp());
}
