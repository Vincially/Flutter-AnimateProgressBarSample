import 'package:flutter/material.dart';
import 'animate_progress.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignUpScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _userNameTextController = TextEditingController();
  double _formProgress = 0;
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgression,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimateProgressIndicator(value: _formProgress),
          Text(
            'Sign up',
            style: Theme.of(context).textTheme.headline4,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: InputDecoration(hintText: 'First name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: InputDecoration(hintText: 'Last name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _userNameTextController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
              child: Text('Sign up')),
        ],
      ),
    );
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  void _updateFormProgression() {
    var progress = 0.0;
    var controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _userNameTextController
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}
