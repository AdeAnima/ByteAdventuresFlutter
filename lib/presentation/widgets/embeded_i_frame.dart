import 'dart:html';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_ui/universal_ui.dart';

class Iframe extends StatefulWidget {
  final String iframeUrl;

  const Iframe({required this.iframeUrl, Key? key}) : super(key: key);

  @override
  _IframeState createState() => _IframeState();
}

class _IframeState extends State<Iframe> {
  Widget? _iframeWidget;

  final IFrameElement _iframeElement = IFrameElement();
  late final ElementStream<Event> scrollEvents;

  @override
  void initState() {
    super.initState();

    _iframeElement
      ..src = widget.iframeUrl
      ..style.border = 'none';

    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (viewId) => _iframeElement,
    );

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }

  @override
  Widget build(BuildContext context) => _iframeWidget == null ? Container() : _iframeWidget!;
}
