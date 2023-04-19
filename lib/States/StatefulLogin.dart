import 'package:flutter/material.dart';
import 'package:projetoa1/Components/Modelo.dart';
import 'package:projetoa1/main.dart';

class StatefulLogin extends StatefulWidget {
  const StatefulLogin({super.key});

  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<StatefulLogin> {
  final GlobalKey<FormState> _chave = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  int? _errorMessage;

  void logar(){
    var encontrado = false;
    _errorMessage = null;

    if (_chave.currentState!.validate()){
      setState(() {
        for (int i = 0; i < MyApp.usuarios.length && !encontrado; i++){
          if (MyApp.usuarios[i].senha != MyApp.getHash(_senha.text)){
            _errorMessage = ErrorMessage.SENHA.id;
            _chave.currentState!.validate();

          } else if (MyApp.usuarios[i].email != _email.text){
            _errorMessage = ErrorMessage.EMAIL.id;
            _chave.currentState!.validate();

          }  else {
            MyApp.usuarioLogado = MyApp.usuarios[i];
            _errorMessage = null;
            encontrado = true;
          }
        }
      });
    }

    if (encontrado) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Modelo(
      title: 'Login',
      principal: false,
      child: SingleChildScrollView(
        child: Form(
          key: _chave,
          child : Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.person, color: Colors.grey, size:100.0),
                ),

                const SizedBox(height: 40.0),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      hintText: 'Entre com o seu email'
                  ),
                  validator: (String? value) {
                    if (_errorMessage != null && _errorMessage == ErrorMessage.EMAIL.id) {
                      var message = ErrorMessage.EMAIL.message;
                      return message;
                    }
                    if (value == null || value.isEmpty) {
                      return "Ta ficando doido??";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _senha,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Entre com a sua   senha'
                  ),
                  validator: (String? value) {
                    if (_errorMessage != null && _errorMessage == ErrorMessage.SENHA.id) {
                      var message =ErrorMessage.SENHA.message;
                      return message;
                    }
                    if (value == null || value.isEmpty) {
                      return "Digita ai na moral";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: ElevatedButton(
                    onPressed: logar,
                    child: const Text("Logar"),
                  ),
                ),

                const SizedBox(height: 100.0),
              ]
            )
          ),
        ),
      ),
    );
  }
}

enum ErrorMessage {
  // ignore: constant_identifier_names
  EMAIL(1, 'Email incorreto'), SENHA(2, 'Senha incorreta');

  final int id;
  final String message;

  const ErrorMessage(this.id, this.message);
}
