import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget {
  final String title;

  final bool? leadingIcon;
  const AppBarWidget({super.key, required this.title,  this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon:leadingIcon==true? const Icon(
              Icons.fork_left,
              size: 30,
            ):SizedBox(
              width: size.width*0.1,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
