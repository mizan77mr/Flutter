import 'package:flutter/material.dart';
import 'package:textfield/sumited_page.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _togglePass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.amber,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email_rounded,
                      size: 30,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.amber,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: 'text@gmail.com'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter your E-mail!";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.lock,
                      size: 30,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        obscureText: _togglePass,
                        controller: _passController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.amber,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {});
                                  _togglePass = !_togglePass;
                                },
                                icon: _togglePass
                                    ? Icon(
                                        Icons.visibility_outlined,
                                        size: 30,
                                        color: Colors.amber,
                                      )
                                    : Icon(
                                        Icons.visibility_off_outlined,
                                        size: 30,
                                        color: Colors.amber,
                                      ))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please create your password!";
                          } else if (value.length < 6) {
                            return "Your password must be allow 6 character!";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SumitedPage(),
                            ));
                      }
                      ;
                    },
                    child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
