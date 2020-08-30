import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Todo{
  bool isDone = false;
  String title;

  Todo(this.title);
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 관리',
      theme: ThemeData(
        primarySwatch: Colors.pink,
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

  //할 일 문자열 조작을 위한 컨트롤러
  var _todoController = TextEditingController();


  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("남은 할 일"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                RaisedButton(
                  child:Text('추가'),
                  onPressed: (){},
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: _items.map((todo)=>_buildItemWidget(todo)).toList(),
              )
            )
          ],
        )
      )
    );
  }

  // List _getTodoList(){
  //   List<Widget> children = [];
  //   for(var item in _items){
  //     children.add(_buildItemWidget(item));
  //   }
  //   return children;
  // }

  Widget _buildItemWidget(Todo todo){
    return ListTile(
      onTap: (){
        //TODO : 클릭 시 완료/취소 처리
      },
      title: Text(
        todo.title,
        style : todo.isDone ? TextStyle(decoration: TextDecoration.lineThrough,
            fontStyle: FontStyle.italic) : TextStyle(fontWeight:FontWeight.bold),
      ),
      trailing: IconButton(
        icon : Icon(Icons.delete_forever),
        onPressed:(){
          //TODO:쓰레기통 클릭 시 삭제되도록 수정
        },
      ),
    );
  }

  //할 일 추가 메서드
  void _addTodo(Todo todo){
    setState(() {
      _items.add(todo);
      _todoController.text = '';
    });
  }

  //할 일 삭제 메서드
  void _deleteTodo(Todo todo){
    setState(() {
      _items.remove(todo);
    });
  }

  //할 일 완료/미완료 메서드
  void _toggleTodo(Todo todo){
    setState((){
      todo.isDone = !todo.isDone;
    });
  }

}

