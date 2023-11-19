import 'package:flutter/material.dart';
import 'package:quickr/Pages/home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffcebdc),
        image: DecorationImage(
          image: const AssetImage("images/bg.png"),
          fit: BoxFit.cover,
          colorFilter:
          ColorFilter.mode(Color(0xfffcebdc).withOpacity(0.1), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.3),
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_sharp,
            size: 100,
            color: Color(0xfff37024),
          ),
          Text(
            " QUICKR",
            style: TextStyle(
                color: Color(0xfff37024),
                fontWeight: FontWeight.w600,
                fontSize: 50,
                letterSpacing: 2,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
              color:Color(0xfff29949),
              fontSize: 35, fontWeight: FontWeight.w500, fontFamily: 'Monserrat'),
        ),
        Text(
          "Please login with your information",
          style: TextStyle(
              color: Color(0xff1f414e), fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Noto Sans Gunjala Gondi'),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xfffcebdc),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
          ),
        ),
        //_buildInputField(emailController),
        const SizedBox(height: 10),

        //password

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xfffcebdc),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
          ),
        ),

        //_buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildOtherLogin(),
      ],
    );
  }


  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
              activeColor: Color(0xff369cda), // Set the desired color here
            ),
            Text(
              "Remember me",
              style: TextStyle(
                  color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Noto Sans Gunjala Gondi'),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "I forgot my password",
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Noto Sans Gunjala Gondi'),
          ),
        )
      ],
    );
  }


  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: Color(0xfffcebdc),
        minimumSize: const Size.fromHeight(60),
        primary: Color(0xffd6edf8),
      ),
      child: const Text("LOGIN",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, fontFamily: 'Noto Sans Gunjala Gondi',color: Color(0xff369cda)),),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not a member?',
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(width: 4),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: Text(
              '  Register now',
              style: TextStyle(
                color: Color(0xff1f414e),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
