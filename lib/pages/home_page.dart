import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();
  late List<String> _tasks = [];

  Widget _textFormField() {
    return TextFormField(
      controller: _controller,
      validator: (value) {
        if(value!.isEmpty) {
          return 'Insira um valor';
        } else {
          return null;
        }
      },
    );
  }

  Widget _sizedBox() {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tasks[index].toUpperCase()),
            onLongPress: () {
              setState(() {
                _tasks.removeAt(index); // Remover uma tarefa
              });
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }

  Widget _floatActionButton(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: () {
        function;
      },
      child: Icon(icon),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget _rowButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _floatActionButton(() => _addTasks(), Icons.add_circle),
        _floatActionButton(() => _removeTasks(), Icons.remove_circle)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Container(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            _textFormField(),
            _sizedBox(),
          ],
        ),
      ),
      floatingActionButton: _rowButtons(),
    );
  }

  _addTasks() {
    log("Tarefa adicionada: ${_controller.text}");

    if(_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text); // Adiciona uma tarefa
      });
      _controller.clear(); // Apaga a tarefa

      log('Lista de Tarefas: $_tasks');
    }
  }

  _removeTasks() {
    _controller.clear(); // Apagar todas as tarfeas
    setState(() {
      _tasks = []; // Remover as Tarefas
    });
  }
}