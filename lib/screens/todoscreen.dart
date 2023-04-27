import 'package:flutter/material.dart';

List<String> texts2 = List.empty(growable: true);
List<bool> isChecked2 = List.empty(growable: true);
final TextEditingController textController = TextEditingController();

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: (context),
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      color: const Color(0xff757575),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Add Task",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.lightBlueAccent, fontSize: 30),
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
                                  textController.clear();
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.lightBlueAccent,
                              ),
                              child: const Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 50),
                ),
                Text(
                  '${texts2.length} tasks left',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white),
              child: ListView.builder(
                itemCount: texts2.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: GestureDetector(
                      child: Text(
                        texts2[index],
                        style: TextStyle(
                            decoration: isChecked2[index]
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      onLongPress: () => setState(() {
                        texts2.removeAt(index);
                        isChecked2.removeAt(index);
                      }),
                    ),
                    value: isChecked2[index],
                    onChanged: (newVal) {
                      setState(
                        () {
                          isChecked2[index] = newVal!;
                        },
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
