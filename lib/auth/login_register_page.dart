import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/auth/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  String _dropdownValueInstrument = "";

  Future<void> signInWithEmailAndPassword() async {
    try {
      Auth()
          .signInWithEmailAndPassword(
            email: _controllerEmail.text,
            password: _controllerPassword.text,
          )
          .then(
            (value) => {
              Provider.of<Auth>(context, listen: false)
                  .loadCurrentUserAttributes()
                  .then(
                    (value) => {
                      GoRouter.of(context).pushReplacement('/auth'),
                    },
                  ),
            },
          );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        firstName: _controllerFirstName.text,
        lastName: _controllerLastName.text,
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        instrument: _dropdownValueInstrument,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Authorisierung');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          fillColor: Colors.grey[100],
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2.5,
            ),
          ),
          hoverColor: Colors.grey[300],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _errorMessage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        errorMessage == '' ? '' : 'Humm? $errorMessage',
      ),
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          if (isLogin) {
            signInWithEmailAndPassword();
          } else {
            createUserWithEmailAndPassword();
          }
        },
        child: Text(isLogin ? 'Login' : 'Registrieren'),
      ),
    );
  }

  Widget _loginOrRegister() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(
          isLogin ? 'Registrieren' : 'Login',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget getForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Instrument',
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            fillColor: Colors.grey[100],
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.5,
              ),
            ),
            hoverColor: Colors.grey[300],
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            _showDropdown(context);
          },
          readOnly: true,
          controller: TextEditingController(
            text: _dropdownValueInstrument,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select an option';
            }
            return null;
          },
        ),
      ),
    );
  }

  Future<void> _showDropdown(BuildContext context) async {
    final newValue = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Wähle ein Instrument aus!'),
          content: DropdownButton<String>(
            value: _dropdownValueInstrument,
            onChanged: (value) {
              Navigator.of(context).pop(value);
            },
            isExpanded: true,
            items: <String>[
              'Drums',
              'Horn',
              'Lyra',
              'Posaune',
              'Sousaphon',
              'Trompete',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );

    if (newValue != null) {
      setState(() {
        _dropdownValueInstrument = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLogin == false)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _entryField('Vorname', _controllerFirstName)),
                  Expanded(child: _entryField('Nachname', _controllerLastName)),
                ],
              )
            else
              Container(),
            if (isLogin == false) getForm() else Container(),
            _entryField('Email', _controllerEmail),
            _entryField('Passwort', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegister(),
          ],
        ),
      ),
    );
  }
}
