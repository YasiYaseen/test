import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConfessionPage extends StatelessWidget {
  TextEditingController _conf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Confession Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text or label for the confession input field
            const Text(
              'Enter your confession:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontFamily: 'Roboto', // Replace with your custom font if needed
              ),
            ),
            const SizedBox(height: 10),

            // Confession input field
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _conf,
                maxLines: 5,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily:
                      'Roboto', // Replace with your custom font if needed
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your confession here...',
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Designed Post Confession Button
            ElevatedButton.icon(
              onPressed: () {
                // Add your logic to post the confession here
                FirebaseFirestore.instance.doc('Confess').set({
                  'message': _conf.value,
                  'date':
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                });
                print('Confession posted!');
              },
              icon: const Icon(Icons.send),
              label: const Text(
                'Post Confession',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily:
                      'Roboto', // Replace with your custom font if needed
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                onPrimary: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.indigo,
                  ),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
