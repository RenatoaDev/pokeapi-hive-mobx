import 'package:flutter/material.dart';
import 'package:pokeapi_project/utils/strings.dart';

class ErrorView extends StatelessWidget {
  final String errorMsg;
  final VoidCallback onPressed;

  const ErrorView({
    Key? key,
    required this.errorMsg,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMsg,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            label: const Text(Strings.refresh),
          ),
        ],
      ),
    );
  }
}
