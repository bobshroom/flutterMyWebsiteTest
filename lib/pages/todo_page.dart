import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'create_page.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<String> todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? saved = prefs.getStringList('todos');
    if (saved != null) {
      setState(() {
        todos = saved;
      });
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', todos);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Todo List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: todos.isEmpty
          ? Center(
              child: Text(
                'Todoはありません',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) => Card(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    setState(() {
                      todos.removeAt(index);
                    });
                    _saveTodos();
                  },
                ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        onPressed: () async {
          // CreatePageから値を受け取る
          final newTodo = await Navigator.of(context).push<String>(
            MaterialPageRoute(builder: (context) => CreatePage()),
          );
          if (newTodo != null && newTodo.isNotEmpty) {
            setState(() {
              todos.add(newTodo);
            });
            _saveTodos();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}