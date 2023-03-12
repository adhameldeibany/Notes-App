import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  List todo = [];
  @override
  void initState() {
    todo.add("Memory");
    todo.add("About me");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          "NOTES",
          style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
            backgroundColor: Colors.grey[50],
            child: const Icon(
              Icons.add,
              color: Colors.purple,
              size: 40,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: TextField(
                        decoration: InputDecoration(hintText: "Your Notes"),
                        onChanged: (String valu) {
                          input = valu;
                        },
                      ),
                      actions: [
                        Center(
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  todo.add(input);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Add ",
                                style: TextStyle(color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )),
                        )
                      ],
                    );
                  });
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext contect, int index) {
              return Dismissible(
                  key: Key(todo[index]),
                  child: Card(
                    shadowColor: Colors.purple,
                    color: Colors.grey[50],
                    elevation: 4,
                    margin: EdgeInsets.all(9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ListTile(
                      title: Text(
                        todo[index],
                        style: TextStyle(fontSize: 18,color: Colors.black),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.purple,
                        ),
                        onPressed: () {
                          setState(() {
                            todo.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
