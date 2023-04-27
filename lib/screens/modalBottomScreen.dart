import 'package:flutter/material.dart';
import 'todoscreen.dart';

class ModalBottom extends StatefulWidget {
  ModalBottom({Key? key}) : super(key: key);

  @override
  State<ModalBottom> createState() => _ModalBottomState();
}

class _ModalBottomState extends State<ModalBottom> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                controller: textController,
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    texts2.add(textController.text);
                    isChecked2.add(false);
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                child: Container(
                  width: double.infinity,
                  color: Color(0xFF4A2676),
                  child: const Text(
                    "Add",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
