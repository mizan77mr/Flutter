import 'package:flutter/material.dart';
import 'package:textfield/sumited_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  bool _isvalidte = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Textfield'),
      //   centerTitle: true,
      //   toolbarHeight: 90,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    TextFormField(

                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            size: 30,
                          ),
                          hintText: 'E-mail',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.orange.shade300, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.blue.shade300, width: 2))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please fill up";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText:_isvalidte,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isvalidte=!_isvalidte;
                                });
                              },
                              icon: _isvalidte
                                  ? Icon(Icons.visibility_outlined)
                                  : Icon(Icons.visibility_off_outlined)),
                          hintText: 'Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.orange.shade300, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.blue.shade300, width: 2))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please create your password';
                        } else if (value.length < 6) {
                          return 'Your password  must be allow 6 character ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
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
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
