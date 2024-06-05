import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:umla_assignment_app/screens/login_page.dart';
import 'package:umla_assignment_app/screens/signup_page.dart';
import 'package:umla_assignment_app/services/auth_services.dart';

class ProfilePage extends StatelessWidget {

  final currentuser =FirebaseAuth.instance.currentUser;
  final authservices=AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile_photo.jpg'), // Replace with the path to your profile picture
                ),
                SizedBox(height: 20),
                Text(
                  '${currentuser?.email.toString().split("@")[0]}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'A brief bio about ${currentuser?.email.toString().split("@")[0]}. she is a software developer with a passion for learning new technologies.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 20),
                buildInfoRow(Icons.email, 'Email', '${currentuser?.email.toString()}'),
                buildInfoRow(Icons.person, 'Assigned Doctor', 'Dr. Smith'),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      authservices.signout(context:context);

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                            color: Colors.cyan),
                        height: 45,
                        width:MediaQuery.sizeOf(context).width,

                        child: Center(child: Text("Log Out",style:TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        )),),),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String title, String value) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.cyan),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
