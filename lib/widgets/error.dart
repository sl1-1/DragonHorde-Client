import 'package:flutter/material.dart';

class ErrorHandlerWidget extends StatefulWidget {
  final Widget child;

  const ErrorHandlerWidget({super.key, required this.child});

  @override
  ErrorHandlerWidgetState createState() => ErrorHandlerWidgetState();
}

class ErrorHandlerWidgetState extends State<ErrorHandlerWidget> {
  // Error handling logic
  void onError(FlutterErrorDetails errorDetails) {
    // Add your error handling logic here, e.g., logging, reporting to a server, etc.
    debugPrint('Caught error: ${errorDetails.exception}');
  }

  @override
  Widget build(BuildContext context) {
    return ErrorWidgetBuilder(
      builder: (context, errorDetails) {
        // Display a user-friendly error screen
        return Scaffold(
          appBar: AppBar(title: Text('Error')),
          body: Center(
            child: Text('Something went wrong. Please try again later.'),
          ),
        );
      },
      onError: onError,
      child: widget.child,
    );
  }
}

class ErrorWidgetBuilder extends StatefulWidget {
  final Widget Function(BuildContext, FlutterErrorDetails) builder;
  final void Function(FlutterErrorDetails) onError;
  final Widget child;

  const ErrorWidgetBuilder({
    super.key,
    required this.builder,
    required this.onError,
    required this.child,
  });

  @override
  ErrorWidgetBuilderState createState() => ErrorWidgetBuilderState();
}

class ErrorWidgetBuilderState extends State<ErrorWidgetBuilder> {
  @override
  void initState() {
    super.initState();
    // Set up global error handling
    FlutterError.onError = widget.onError;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
