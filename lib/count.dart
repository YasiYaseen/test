import 'package:flutter/material.dart';

class CounterCardWidget extends StatelessWidget {
  final int confessionCount;

  CounterCardWidget({required this.confessionCount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDone(context, 'Don\'t tap here  ', Icons.warning, Colors.yellow);
      },
      onDoubleTap: () {
        showDone(context, 'I dare you to post your confession  ',
            Icons.dangerous, Colors.red);
      },
      onLongPress: () {
        showDone(context, 'Don\'t play here  ', Icons.dangerous, Colors.red);
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 91, 180, 252), Colors.indigo],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.article_rounded,
                color: Colors.white,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                '$confessionCount Confessions',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showDone(BuildContext ctx, String name, IconData icon, Color c) {
  final size = MediaQuery.of(ctx).size;
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
    width: size.width * .5,
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
    elevation: 5,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Icon(
          icon,
          color: c,
        ),
      ],
    ),
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  ));
}
