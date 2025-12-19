import 'package:flutter/material.dart';

class ComplianceWidget extends StatelessWidget {
  const ComplianceWidget({super.key, required this.isCompliant});
  final bool isCompliant;

  @override
  Widget build(BuildContext context) {
    if (isCompliant) {
      return Image.asset('assets/images/compliance_true.png');
    } else {
      return Image.asset('assets/images/compliance_false.png');
    }
  }
}
