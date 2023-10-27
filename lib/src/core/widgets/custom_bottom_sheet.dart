import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const Text("Filter"),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Handle a button click inside the custom bottom sheet
            Navigator.pop(context); // Close the bottom sheet
          },
          child: const Text("Close"),
        ),
      ],
    );
  }
}