import 'dart:html';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:universal_ui/universal_ui.dart';

class Iframe extends StatefulWidget {
  final String iframeUrl;
  final int? iframeWidth;
  final int? iframeHeight;

  const Iframe({required this.iframeUrl, Key? key, this.iframeWidth, this.iframeHeight}) : super(key: key);

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

    if (widget.iframeWidth != null) _iframeElement.width = widget.iframeWidth.toString();
    if (widget.iframeHeight != null) _iframeElement.height = widget.iframeHeight.toString();

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
  Widget build(BuildContext context) {
    if (_iframeWidget == null) return const CircularProgressIndicator();
    if (widget.iframeHeight != null && widget.iframeWidth != null) {
      return SizedBox(
        width: widget.iframeWidth!.toDouble(),
        height: widget.iframeHeight!.toDouble(),
        child: _iframeWidget,
      );
    }
    return _iframeWidget!;
  }
}
