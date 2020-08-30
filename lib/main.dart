import 'package:flutter/material.dart';

import 'model/Todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 관리',
      theme: ThemeData(
        primarySwatch: Colors.lime,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _items = <Todo>[];

  // 할 일 문자열 조작을 위한 컨트롤러
  var _todoController = TextEditingController();


  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할 일'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                RaisedButton(
                  child: Text('추가'),
                  onPressed: () {}, // TODO : 추가버튼처리
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[],
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _buildItemWidget(Todo todo){
    return ListTile(
      onTap: () {
        // TODO : 클릭 시 완료/취소 처리
      },
      title: Text(
        todo.title,
        style: todo.isDone ? TextStyle(decoration: TextDecoration.lineThrough,
            fontStyle: FontStyle.italic) : TextStyle( fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon : Icon(Icons.delete_forever),
        onPressed: () {
          // TODO : 쓰레기 버튼 클릭 시 삭제
        } ,
      ),
    );
  }
}
