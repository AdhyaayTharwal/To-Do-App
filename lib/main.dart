import 'package:flutter/material.dart';
void main(){runApp(MaterialApp(
     home:BaseUI()));}
class BaseUI extends StatefulWidget {
  @override
  _BaseUIState createState() => _BaseUIState();
}

class _BaseUIState extends State<BaseUI> {
  List todo=List();
  String input="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todo.add('Item 1');
  }
  @override
  Widget build(BuildContext context) {

    return

        Scaffold(
          appBar: AppBar(
            title: Text('To Do App'),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){
            showDialog(context: context,
            builder: (BuildContext context){
             return  AlertDialog(
                title: Text('Add the Task'),
                content: TextField(
                    onChanged:( String task ){
                    input=task;
                    },),
               actions: <Widget>[FlatButton(onPressed: (){
                 setState(() {
                   todo.add(input);

                 });
               },
                child: Text('Add'),)],
              );

            }
            );
          },
          child: Icon(Icons.add),),
          body: ListView.builder(
              itemCount:todo.length ,
              itemBuilder:( BuildContext context, int index )
              {
                return Dismissible(
                  key: Key(todo[index]),
                  child:Card(
                    elevation: 2,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(6)),
                    child: ListTile(title: Text(todo[index]),
                      subtitle: Text('Please do this task'),
                     trailing: IconButton(
                       icon: Icon(Icons.delete, color: Colors.red)
                      ,onPressed: (){
                         setState(() {
                           todo.removeAt(index);
                         });
                     },
                     ),),
                  ),
                );
              }),
        );

  }
}
