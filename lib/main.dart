import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
var wtController = TextEditingController();
var ftController = TextEditingController();
var inController = TextEditingController(); 
var result ='';
var msg = "";

var bgColor = Colors.blue.shade200;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.blue,
        
        title: Center(child: Text(widget.title,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w700),)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
        
          child: SizedBox(
            width: 320,
            child: Column(
                       
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              TextField(
                controller: wtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('Enter Your Weight(in Kgs)'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusColor: Colors.blue,
                ),
        
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: ftController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('Enter Your Height(in Feets)'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusColor: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: inController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text('Enter Height(in Inchs)'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  focusColor: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

                               
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){
        
                 var wt = wtController.text.toString();
                 var ft = ftController.text.toString();
                 var inc = inController.text.toString();
        
                if(wt != "" && ft != "" && inc != ""){
                    var intFt = int.parse(ft);
                    var intWt = int.parse(wt);
                    var intIn = int.parse(inc);

                    var totalHt = ((intFt*12 + intIn)/39.37);

                    var bmi = intWt/(totalHt*totalHt);
                    result = bmi.toStringAsFixed(3);
                  
                    if(bmi > 25){
                        msg = "You are over Weighted!! \nBMI Value:";
                        bgColor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = "You are Under Weighted!! \nBMI Value:";
                      bgColor = const Color.fromARGB(255, 241, 108, 108);
                    }else{
                      msg = "You are fit and fine!! \nBMI Value:";
                      bgColor = Colors.green.shade200;
                    }

                }else{
                  result = 'Please fill all the input fields!!';
                }

        
                setState(() {
                   
                });
              }, child: const Text('Calculate',style: TextStyle(fontSize: 20),)),



              const SizedBox(height: 20,),


              ElevatedButton(
            
                onPressed: (){
                
                setState(() {
                wtController.text = "";
                ftController.text = "";
                inController.text = "";
                msg = "";
                result = "";
                bgColor = Colors.blue.shade200;
                });
              }, child: const Text("Restart",style: TextStyle(fontSize: 20),)),
             
                ],
              ),
        
              const SizedBox(
                height: 20,
              ),
        
              Text("$msg  $result",style: const TextStyle(fontSize: 20),),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
