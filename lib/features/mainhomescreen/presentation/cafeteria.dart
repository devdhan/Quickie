import 'package:flutter/material.dart';
import 'package:quickq/commons/custom/cafeteria_grid.dart';
import 'package:quickq/commons/appbar/custom_appbar.dart';
import 'package:quickq/constants/colors.dart';

class Cafeteria extends StatefulWidget {
  const Cafeteria({super.key});

  @override
  State<Cafeteria> createState() => _CafeteriaState();
}

class _CafeteriaState extends State<Cafeteria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Select a Cafeteria', showLeading: false),
      backgroundColor: backgroundColor,
      body: CafeteriaGrid(),
    );
  }
}
