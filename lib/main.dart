import 'package:flutter/material.dart';

main() => runApp(const Farha());

class Farha extends StatelessWidget {
  const Farha({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// create new todo
// remove todo
// show all todo
// edit a todo

class _HomeState extends State<Home> {
  List<String> todos = [];
  TextEditingController todoNameEditingController = TextEditingController();
  TextEditingController UpdatetodoNameEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple To-Do"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Add to-do"),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: todoNameEditingController,
                        decoration: const InputDecoration(
                          hintText: "Write your to-do",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (todoNameEditingController.text
                              .trim()
                              .isNotEmpty) {
                            todos.add(
                              todoNameEditingController.text.trim(),
                            );
                            todoNameEditingController.text = "";
                            setState(() {});
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("Your to-do"),
                      ),
                    ],
                  ),
                );
              });
        },
        label: const Text("Add a new todo"),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final String todo = todos[(todos.length - 1) - index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Card(
                elevation: 4,
                child: Row(
                  children: [
                    Text(
                      todos[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        todos.removeAt((todos.length - 1) - index);
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        UpdatetodoNameEditingController.text = todo;
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text("Udate to-do"),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    TextField(
                                      controller:
                                          UpdatetodoNameEditingController,
                                      decoration: const InputDecoration(
                                        hintText: "Write your to-do",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (UpdatetodoNameEditingController.text
                                            .trim()
                                            .isNotEmpty) {
                                          todos[(todos.length - 1) - index] =
                                              UpdatetodoNameEditingController
                                                  .text
                                                  .trim();
                                          setState(() {});
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text("Update to-do"),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
