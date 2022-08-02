import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class SignInpage extends StatefulWidget {
  const SignInpage({Key? key}) : super(key: key);

  @override
  State<SignInpage> createState() => _SignInpageState();
}

class _SignInpageState extends State<SignInpage> {
  bool checkVal = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  String pickedDate = "Choose your birthdate";



  int _value = 1;
  bool _value1 = false;

  var item = ["DHAKA",	"BANDARBAN",	"BOGRA",	"BAGERHAT",
    "FARIDPUR",	"BRAHMANBARIA",	"CHAPAINABABGANJ",	"CHUADANGA",
    "GAZIPUR",	"CHANDPUR",	"JOYPURHAT",	"JHENAIDAH",
    "GOPALGANJ",	"CHITTAGONG",	"PABNA",	"JESSORE",
    "KISHOREGONJ",	"COMILLA",	"NAOGAON",	"KHULNA",
    "MADARIPUR",  	"COX`S BAZAR",	"NATORE",	"KUSHTIA",
    "MANIKGANJ",	"FENI",	"RAJSHAHI",	"MAGURA",
    "MUNSHIGANJ",	"KHAGRACHHARI",	"SIRAJGANJ",	"MEHERPUR",
    "NARAYANGANJ",	"LAKSHMIPUR",	 	"NARAIL",
    "TANGAIL",	"NOAKHALI",	"Rangpur", 	"SATKHIRA",
    "NARSINGDI",	"RANGAMATI",	"DINAJPUR",
    "RAJBARI",	 	"GAIBANDHA",	"Sylhet",
    "SHARIATPUR",	"Barishal",	"KURIGRAM",	"HABIGANJ",
    "BARGUNA",	"LALMONIRHAT",	"MAULVIBAZAR",
    "Mymensing",	"BARISAL",	"NILPHAMARI",	"SUNAMGANJ",
    "MYMENSINGH",	"BHOLA",	"PANCHAGARH",	"SYLHET",
    "JAMALPUR",	"JHALOKATI",	"RANGPUR",
    "NETRAKONA",	"PATUAKHALI",	"THAKURGAON",
    "SHERPUR",	"PIROJPUR"];
  var district;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(3.0)),
          //Image.network("https://1000logos.net/wp-content/uploads/2016/11/Facebook-Logo-Meaning.jpg"),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your name"
            ),
          ),
          //mail
          TextField(
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your email"
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your password"
            ),
          ),
          Row(
            children: [
              Text("District"),
              Container(
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border:Border.all()
                    ),
                    alignment: Alignment.centerRight,
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton(
                        iconSize: 40,
                        items: item.map((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                        value: district,
                        onChanged: (val) {
                          district = val;
                          setState(() {});
                        }),
                  ),
                )
              ),
            ],
          ),


          TextButton(onPressed: ((){
            DatePicker.showDatePicker(context,
            minTime: DateTime(2000,01,01),
              maxTime: DateTime(2050,12,31),
              theme: DatePickerTheme(
                headerColor: Colors.blueGrey,
                backgroundColor: Colors.yellowAccent
              ),
              onChanged: (date){
              pickedDate = date.toString();
              setState((){

              });

              }
            );
          }), child: Text(pickedDate)),
          Text("Gender"),
          Row(children: [

            Radio(value: 1,
                groupValue: _value,
                onChanged: (value){
                  setState((){
                    _value = 1;
                  });
                }),
            SizedBox(
              width: 10.0
            ),
            Text("Male"),

          ],),
          Row(children: [

            Radio(value: 2,
                groupValue: _value,
                onChanged: (value){
                  setState((){
                    _value = 2;
                  });
                }),
            SizedBox(
                width: 10.0
            ),
            Text("Female"),

          ],),
          Row(children: [

            Radio(value: 3,
                groupValue: _value,
                onChanged: (value){
              setState((){
                _value = 3;
              });
                }),
            SizedBox(
                width: 10.0
            ),
            Text("Others"),

          ],),





          Row(
            children: [
              Checkbox(checkColor: Colors.black,activeColor: Colors.white,value: checkVal, onChanged: (response){
                setState((){
                  checkVal = response!;
                });

              }),
              Text("Terms and Conditions Apply"),
            ],
          ),
          Row(
            children: [
              Switch(value: _value1,
                  onChanged: (val){
                setState((){
                  _value1 = val;
                });
                  }),
              Text("Saved log in")
            ],
          ),


         ElevatedButton(onPressed: (){
           registration();
         }, child: Text("Sign Up"))



        ],),

    );
  }
  registration(){

    String name = nameController.text.toString();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString();
    String District = district != null ? district : "";



    var data  = {
      "name":name,
      "email":email,
      "password":password,
      "pickedDate":pickedDate,
      "District" : District,
      "Gender" : _value,
      "Terms": checkVal,
      "isSaved" : _value1
    };


    print(jsonEncode(data));
    //jsonEncode(data);


  }
}

