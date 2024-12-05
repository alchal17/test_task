import 'package:flutter/material.dart';
import 'package:test_task/view/colors.dart';
import 'package:test_task/view/screens/process_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller =
      TextEditingController(text: 'https://flutter.webspark.dev/flutter/api');

  HomeScreen({super.key});

  void _showEmptyFieldAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Input Error'),
          content: const Text('Please enter a valid API base URL.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'Home screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set valid API base URL in order to continue',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.sync_alt, color: Colors.grey),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Enter base URL',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(
            backgroundColor: Colors.blue.shade300,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color.fromARGB(255, 0, 86, 157)),
                borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              if (_controller.text.isEmpty) {
                _showEmptyFieldAlert(context);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProcessScreen(
                      url: _controller.text,
                    ),
                  ),
                );
              }
            },
            label: const Text(
              'Start counting process',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
