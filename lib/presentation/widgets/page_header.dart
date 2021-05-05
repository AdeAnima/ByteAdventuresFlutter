import 'package:flutter/material.dart';

import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';

class PageHeader extends StatelessWidget {
  final String text;

  const PageHeader({required this.text, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: Theme.of(context).textTheme.headline1!.resize(context),
        ),
      );
}
