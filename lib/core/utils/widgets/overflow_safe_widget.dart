import 'package:flutter/material.dart';

/// A widget that provides safe overflow handling for its child
/// with customizable error handling and recovery options
class OverflowSafeWidget extends StatelessWidget {
  const OverflowSafeWidget({
    super.key,
    required this.child,
    this.onOverflow,
    this.fallbackWidget,
    this.showErrorBoundary = false,
    this.maxWidth,
    this.maxHeight,
    this.scrollable = true,
  });

  final Widget child;
  final VoidCallback? onOverflow;
  final Widget? fallbackWidget;
  final bool showErrorBoundary;
  final double? maxWidth;
  final double? maxHeight;
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    Widget safeChild = child;

    // Wrap with constraints if specified
    if (maxWidth != null || maxHeight != null) {
      safeChild = ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity,
        ),
        child: safeChild,
      );
    }

    // Add scrolling capability if enabled
    if (scrollable) {
      safeChild = SingleChildScrollView(child: safeChild);
    }

    // Wrap with error boundary if enabled
    if (showErrorBoundary) {
      return _ErrorBoundary(onError: onOverflow, fallback: fallbackWidget, child: safeChild);
    }

    return safeChild;
  }
}

/// Internal error boundary widget
class _ErrorBoundary extends StatefulWidget {
  const _ErrorBoundary({required this.child, this.onError, this.fallback});

  final Widget child;
  final VoidCallback? onError;
  final Widget? fallback;

  @override
  State<_ErrorBoundary> createState() => _ErrorBoundaryState();
}

class _ErrorBoundaryState extends State<_ErrorBoundary> {
  bool _hasError = false;

  @override
  void initState() {
    super.initState();

    // Set up error handler
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.exception.toString().contains('overflow') ||
          details.exception.toString().contains('RenderFlex')) {
        setState(() {
          _hasError = true;
        });
        widget.onError?.call();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return widget.fallback ?? _buildDefaultErrorWidget(context);
    }

    try {
      return widget.child;
    } catch (e) {
      if (e.toString().contains('overflow') || e.toString().contains('RenderFlex')) {
        widget.onError?.call();
        return widget.fallback ?? _buildDefaultErrorWidget(context);
      }
      rethrow;
    }
  }

  Widget _buildDefaultErrorWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.error, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning_amber_rounded, color: Theme.of(context).colorScheme.error, size: 24),
          const SizedBox(height: 8),
          Text(
            'Layout Error Detected',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Content doesn\'t fit in available space',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onErrorContainer),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              setState(() {
                _hasError = false;
              });
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

/// Extension methods for easier overflow protection
extension OverflowSafeExtension on Widget {
  /// Wraps the widget with overflow protection
  Widget overflowSafe({
    VoidCallback? onOverflow,
    Widget? fallbackWidget,
    bool showErrorBoundary = false,
    double? maxWidth,
    double? maxHeight,
    bool scrollable = true,
  }) {
    return OverflowSafeWidget(
      onOverflow: onOverflow,
      fallbackWidget: fallbackWidget,
      showErrorBoundary: showErrorBoundary,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      scrollable: scrollable,
      child: this,
    );
  }

  /// Wraps the widget with basic overflow protection using Flexible
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return Flexible(flex: flex, fit: fit, child: this);
  }

  /// Wraps the widget with expanded to fill available space
  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  /// Wraps text widgets with overflow protection
  Widget textOverflowSafe({TextOverflow overflow = TextOverflow.ellipsis, int? maxLines}) {
    if (this is Text) {
      final text = this as Text;
      return Text(
        text.data ?? '',
        style: text.style,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: text.textAlign,
        textDirection: text.textDirection,
        locale: text.locale,
        softWrap: text.softWrap,
        textScaleFactor: text.textScaleFactor,
        semanticsLabel: text.semanticsLabel,
        textWidthBasis: text.textWidthBasis,
        textHeightBehavior: text.textHeightBehavior,
      );
    }
    return this;
  }
}
