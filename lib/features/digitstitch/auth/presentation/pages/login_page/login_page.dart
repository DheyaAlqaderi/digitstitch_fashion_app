import 'package:digitstitch_app/features/digitstitch/Home/presentation/pages/home/home_page.dart';
import 'package:digitstitch_app/features/digitstitch/auth/presentation/cubit/login/login_cubit.dart';
import 'package:digitstitch_app/features/digitstitch/auth/presentation/pages/signup_page/signup_page.dart';
import 'package:digitstitch_app/features/digitstitch/auth/presentation/widgets/custome_text_feild_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/helper/shareprefrence_manager.dart';
import '../../cubit/login/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFirstTimeShow();
  }

  Future<void> setFirstTimeShow() async {
    // Save data
    await SharedPrefManager.saveData('FirstTime', 'value');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is ErrorLoginState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('An error occurred during login. Please try again.'),
              ),
            );
          } else if (state is SuccessLoginState) {
            // Navigate to HomePage when login is successful
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        builder: (context, state) {
        return SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Hero(
                    tag: "image1",
                      child: SvgPicture.asset("assets/svg/image4.svg")), // Use Image.asset instead of SvgPicture.asset for images
                ),
                Positioned(
                  top: 50.0,
                  right: 0,
                  child: SvgPicture.asset("assets/svg/image2.svg"),
                ),
                const Positioned(
                  top: 100.0,
                  left: 20.0,
                  child: Column(
                    children: [
                      Text("تسجيل", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),),

                      Text("الدخول", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 300,left: 20,right: 20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                context.read<LoginCubit>().login(
                                   _emailController.text.toString(),
                                   _passwordController.text.toString(),

                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: state is LoadingLoginState
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                'تسجيل',
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20.0),
                          InkWell(
                            onTap: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const SignUpPage()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Hero( tag: 'create account',child:  Text("أنشاء حساب" , style: TextStyle(fontSize: 17.0),)),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const SignUpPage()),
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

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
      },
    ),
    );
  }

}

