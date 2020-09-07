import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Name"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Name Is Required";
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return "Email Is Required";
        }
        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return "Password Is Required";
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildUrlField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Url"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Url Is Required";
        }
        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Phone Number"),
      validator: (String value) {
        if (value.isEmpty) {
          return "Phone Number Is Required";
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildCaloriesField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calories'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Demo"),
      ),
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNameField(),
                _buildEmailField(),
                _buildPasswordField(),
                _buildUrlField(),
                _buildPhoneNumberField(),
                _buildCaloriesField(),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
