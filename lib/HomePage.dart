import 'package:flutter/material.dart';
import 'package:todo_list_app/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List ToDoList = [];
  String item = "";

  MyInputOnChange(content) {
    setState(() {
      item = content;
    });
  }

  AddItem() {
    setState(() {
      ToDoList.add({'item': item});
    });
  }

  RemoveItem(index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 30,
                child: Row(
                  children: [
                    Expanded(
                        flex: 50,
                        child: TextFormField(
                          onChanged: (content) {
                            MyInputOnChange(content);
                          },
                          decoration: MyInput("List"),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        flex: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: ElevatedButton(
                            onPressed: () {
                              AddItem();
                            },
                            child: Text("Add"),
                            style: button(),
                          ),
                        )),
                  ],
                )),
            Expanded(
              flex: 90,
              child: ListView.builder(
                itemCount: ToDoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(ToDoList[index]['item'].toString()),
                      trailing: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: IconButton(
                            onPressed: () {
                              RemoveItem(index);
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
