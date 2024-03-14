import 'package:digitstitch_app/features/digitstitch/auth/presentation/pages/login_page/login_page.dart';
import 'package:digitstitch_app/features/digitstitch/auth/presentation/widgets/custome_text_feild_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Use Image.asset instead of SvgPicture.asset for images
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset("assets/svg/image.svg"),
            ),
            Positioned(
              top: 50.0,
              right: 0,
              child: SvgPicture.asset("assets/svg/image2.svg"),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Hero(
                tag: "image1",
                child: SvgPicture.asset("assets/svg/image3.svg"),
              ),
            ),
            const Positioned(
              top: 100.0,
              left: 20.0,
              child: Hero(
                tag: "create account",
                child: Column(
                  children: [
                    Text("أنشاء", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),),

                    Text("حساب", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 250.0,left: 20,right: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextFieldWidget(
                      controller: _fNameController,
                      hintText: "Enter your first name",
                      name: "First Name",
                      textInputType: TextInputType.text,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFieldWidget(
                      controller: _lNameController,
                      hintText: "Enter your last name",
                      name: "Last Name",
                      textInputType: TextInputType.text,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFieldWidget(
                      controller: _phoneController,
                      hintText: "Enter your phone",
                      name: "Phone",
                      textInputType: TextInputType.number,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFieldWidget(
                      controller: _emailController,
                      hintText: "Enter your email",
                      name: "Email",
                      textInputType: TextInputType.emailAddress,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFieldWidget(
                      controller: _passwordController,
                      hintText: "Enter your password",
                      name: "Password",
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      height: 61,
                      width: double.infinity, // Optionally set the width to stretch to the maximum available space
                      child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Adjust the radius here
                          ),
                        ),
                        child: const Text('أنشاء' , style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("لدي حساب بالفعل" , style: TextStyle(fontSize: 17.0),),
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginPage()),
                                  );
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.brown,
                                  ),
                                  child: const Icon(Icons.arrow_forward, color: Colors.white,),
                                ),
                              )
                            ],
                          ),
                        ),
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

