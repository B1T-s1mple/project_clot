import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final List<String> lyuboy;
  const NewPage({super.key, required this.lyuboy});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.lyuboy.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.lyuboy[index]),
          );
        },
      ),
    );
  }
}
