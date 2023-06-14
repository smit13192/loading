import 'package:flutter/material.dart';
import 'package:loading/loading_controller.dart';

class ScreenLoadingController {
  ScreenLoadingController._();

  static final ScreenLoadingController _instance = ScreenLoadingController._();

  LoadingController? _controller;

  static ScreenLoadingController get instance => _instance;

  void show(BuildContext context) {
    if (_controller?.show() ?? false) {
      return;
    } else {
      _controller = _showLoading(context);
    }
  }

  void hide() {
    _controller?.hide();
    _controller = null;
  }

  _showLoading(BuildContext context) {
    final state = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(125),
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );

    state.insert(entry);

    return LoadingController(
      show: () {
        return true;
      },
      hide: () {
        entry.remove();
        return true;
      },
    );
  }
}
