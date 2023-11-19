import 'package:flutter/material.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(top: 45, child: _buildBottom()),

        ],
      ),
    );
  }



  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*CircleAvatar(
          radius: 50, // Adjust the radius as needed
          backgroundColor: Colors.grey,
          //backgroundImage: AssetImage('images/icons8-user-50.png'),
        ),*/
        const Icon(
          Icons.person,
          size: 100,
        ),
        const SizedBox(height: 20),
        Text(
          "Get On Board!",
          style: TextStyle(
            color: Color(0xfff29949),
            fontSize: 35,
            fontWeight: FontWeight.w500,
            fontFamily: 'Monserrat',
          ),
        ),
        Text(
          "Create your profile and start the journey.",
          style: TextStyle(
            color: Color(0xff1f414e),
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Noto Sans Gunjala Gondi',
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfffcebdc),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: fullNameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Full Name',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfffcebdc),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfffcebdc),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),

          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xfffcebdc),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: TextButton(
                onPressed: () => _selectDate(context),
                child: Text(
                  selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : 'Select Date of Birth',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        _buildRegisterButton(),
        const SizedBox(height: 20),
        _buildLoginLink(),
        const SizedBox(height: 20),
        _buildOtherLogin(),
      ],
    );
  }



  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Full Name: ${fullNameController.text}");
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },

      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        elevation: 20,
        shadowColor: Color(0xfffcebdc),
        minimumSize: Size.fromHeight(60),
        primary: Color(0xffd6edf8),
      ),
      child: Text(
        "REGISTER",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Noto Sans Gunjala Gondi',
          color: Color(0xff369cda),
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'OR',
            style: TextStyle(color: Colors.grey[700],fontSize: 15,fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),

        ],
      ),
    );
  }
  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("images/google.png")),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}



