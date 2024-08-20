import 'package:cms_app/features/dash_board/presentation/pages/dash_board.dart';
import 'package:cms_app/features/emr/presentation/pages/add_treatment.dart';
import 'package:cms_app/features/emr/presentation/pages/complaints.dart';
import 'package:cms_app/features/emr/presentation/pages/emr.dart';
import 'package:cms_app/features/emr/presentation/pages/observations.dart';
import 'package:cms_app/features/emr/presentation/pages/treatment_list.dart';
import 'package:cms_app/features/laboratory/presentation/pages/laboratory.dart';
import 'package:cms_app/features/signin/presentation/pages/signin_page.dart';
import 'package:cms_app/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Observations(),
    );
  }
}