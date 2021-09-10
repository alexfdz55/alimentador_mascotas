import 'package:alimentador_mascote/app/shared/widgets/text_title.dart';
import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  final String text;

  const TitleInput({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      child: TextTitle(title: this.text, centerText: true, fontSize: 20),
    );
  }
}
