import 'package:dio/dio.dart';
import 'package:dragonhorde_client_flutter/api_provider.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final DioException exception;
  final ErrorInterceptorHandler handler;
  const ErrorPage({super.key, required this.exception, required this.handler});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(child: 
           Column (
              children: [
                Center(child: Text(widget.exception.message!)),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    apiClient.retryRequest(widget.exception, widget.handler);
                    Navigator.pop(context);
                  },
                  child: Text('Retry'),
                ),
                                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
