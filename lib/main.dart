import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class User {
  String name;
  String email;
  String avatar;
  Color color;

  User({this.name, this.email, this.avatar, this.color});
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users;
  User _currentUser;

  void _showMessage() {
    setState(() {
      this._currentUser = this.users[1];
    });
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Olá'),
        content: Text('Seja bem vindo ao meu app Windows'),
        actions: [
          TextButton(
            child: Text('Fechar'),
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    users = [
      User(
        name: 'André Gusmão',
        email: 'andre.gusmao@albg.dev.br',
        avatar: 'AG',
        color: Colors.blue[800],
      ),
      User(
        name: 'Adriana Francione',
        email: 'afrancione@infoagesistemas.com.br',
        avatar: 'AF',
        color: Colors.orange,
      ),
      User(
        name: 'Agnes Lorah',
        email: 'dricafrancione@gmail.com',
        avatar: 'AL',
        color: Colors.purple,
      ),
    ];
    this._currentUser = this.users[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de app Windows com Flutter'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text(this._currentUser.email),
              accountName: Text(this._currentUser.name),
              currentAccountPicture: CircleAvatar(
                child: Text(this._currentUser.avatar),
                backgroundColor: this._currentUser.color,
                foregroundColor: Colors.white,
              ),
              otherAccountsPictures: this
                  .users
                  .where((User user) => user.email != this._currentUser.email)
                  .map(
                (User user) {
                  print(user.name);
                  return GestureDetector(
                    child: CircleAvatar(
                      child: Text(user.avatar),
                      backgroundColor: user.color,
                      foregroundColor: Colors.white,
                    ),
                    onTap: () {
                      setState(() => this._currentUser = user);
                    },
                  );
                },
              ).toList(),
            ),
            ListTile(
              title: Text('Cadastros'),
            ),
            ListTile(
              title: Text('Entradas'),
            ),
            ListTile(
              title: Text('Consultas'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Este é um teste de app Windows',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showMessage,
        tooltip: 'exibir mensagem',
        child: Icon(Icons.desktop_windows),
      ),
    );
  }
}
