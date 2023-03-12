import'package:untitle5/ListOfValue.dart';
import'package:flutter/material.dart';


class HomePage extends StatelessWidget{



  const HomePage ({key?key}):super(key:key);



@override
State<Homepage> createState() =>_HomePageState();
}
class  _HomePageState extends State<HomePage>{
TextEditingController nameController =TextEditingController();
TextEditingController phoneController=TextEditingController();
TextEditingController emailController=TextEditingController();


  List  <ListOfValue> data =List.empty(growable:true);
  int selectedIndex = -1;
  @override
    return Scaffold(
      appBar:AppBar(
        
        centerTitle:true,
        title:Text('flutter Demo')
        ),
        body:Padding(
          padding:const EdgeInset.all(8.0),
        child:Column(
          childern:const[
            const SizedBox(height:10),
            Textfield(
              controller:nameController,
          keyboardType:TextInputType.text,
          maxLength:200,
              decoration:InputDecoration(
                hintText:'Name',
                labelText:'Name',
              icon: const Icon(Icons.person),  
              border:OutlineInputBorder(
                borderRadius:BorderRadius.all(
                  Radius.circular(10),
                )
              )
              ),
            ),//textfield
            const SizedBox(height: 10),
            TextField(
              controller:phoneController,
              keyboardType:TextInputType.number,
              maxLength:10,
              decoration:InputDecoration(
                hintText:'phone number',
                labelText:'phone number',
              icon: const Icon(Icons.phone),  
              border:OutlineInputBorder(
                borderRadius:BorderRadius.all(
                  Radius.circular(10),
                )
              )

              
            ),
            ),//textfield
            const SizedBox(height: 10),
            TextField(
controller:emailController,
              decoration:InputDecoration(
                hintText:'email',
                labelText:'email  id',
              icon: const Icon(Icons.email),  
              border:OutlineInputBorder(
                borderRadius:BorderRadius.all(
                  Radius.circular(10),
                )
              )

              ),
            ),//TextfieldS
             const SizedBox(height:10),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              childern:[
                ElevatedButton(onPressed :(){
                  String name =nameController.Text.trim(),
                  String phone =phoneController.Text.trim(),
                  String email= emailController.Text.trim(),
                  if(name.isNotEmpty && phone.isNotEmpty && email.isNotEmpty){
                    setstate((){
                      nameController.text='';
                      phoneController.text='';
                      emailController.text='';
                      ListOfValue.add(data(name:name,phone:phone,email:email));

                    });//setstate
                  }//if

                } ,//elevatedbutton
                child:const Text('Saved')),//Elevated button
                 ElevatedButton(onPressed :(){
                  String name = nameController.text.trim();
                  String phone= phoneController.text.trim();
                  String email = emailController.text.trim(); 
                  if(name.isNotEmpty && phone.isNotEmpty && email.isNotEmpty){
                    setstate((){
                      nameController.text='';
                      phoneController.text='';
                      emailController.text='';
                      data[selectedIndex].name=name;
                      data[selectedIndex].phone=phone;
                      data[selectedIndex].email=email;
                      selectedIndex= -1;
                      

                    });//setstate
                  }//if






                } ,child:const Text('update')),//Elevated button



              ],

            ),//Row 
            const SizedBox(height:10),
            data.isEmpty? const Text(
              'No data yet.....',
              style:TextStyle(fontSized:22)
            )//Text
            Expanded(
            Listview.builder(
              itemCount:data.length
              iteamBuilder:(context,index)=>getRow(),
              )//listview.builde
        )//Expanded
             ],
        ),//Column
        ),//Padding
    );//Scaffold
  }
  Widget getRow(int index){
    return Card(
      
child:ListTitle(
  leading:CircleAvatar(
    backgroundColor:index % 2 == 0 ? Color.deepPurple : Colors.purple,
    foregroundColor:Color.white,
    child:Text(data[index].name[0],  style: const TextStyle(fontWeight:FontWeight.bold),
    ),//text
    

  ),//circleavatar
      title:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        childern:[
          Text(data[index].name, style: const TextStyle(fontWeight:FontWeight.bold)),
          Text(data[index].phone),
          Text(data[index].email),



        ],
      ),//column
trailing:SizedBox(
  width:70,
  child:Row(
  childern:[
    InkWell(
      onTap:(){
        nameController.text =data[index].name;
        phoneController.text= data[index].phone;
        emailController.text = data[index].email;
        setstate((){
          selectedIndex = index;
        });

      },
    Icon(Icon.edit)),
    InkWell(
      onTap:(){
        setstate((){
          data.removeAt(index);
        });

      },
    Icon(Icon.delete)),

  ],
  ),//Row
),//SizedBox
      ),//listTile
    );//card
  }
}