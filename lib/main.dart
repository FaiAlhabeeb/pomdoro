import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key}):super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({Key?key}):super(key:key);

  



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Duration duration1=Duration(minutes: 25);


  
Timer? repeatedfunction;
startTimer(){

repeatedfunction= Timer.periodic(Duration (seconds: 1),(timer) { 
setState(() {
  
  int newsec=duration1.inSeconds-1;
  duration1=Duration(seconds: newsec);
if(duration1.inSeconds==0){
  repeatedfunction!.cancel();
  setState(() {
    duration1=Duration(minutes: 25);
    isruning=false;
  });
}
  });


});
  

}
bool isruning=false;

Widget build(BuildContext context){


return Scaffold(
backgroundColor: const Color.fromARGB(255, 48, 45, 45),
  appBar: AppBar(
    title: Text("Pomodoro App",style: TextStyle(fontSize: 22,color: Colors.white),),
    backgroundColor: Color.fromARGB(255, 35, 34, 34),
  ),
    body:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          CircularPercentIndicator(
          radius:120.0,
progressColor: Color.fromARGB(255, 41, 24, 133),
lineWidth: 7,
percent: duration1.inMinutes/25,
animation: true,
animateFromLastPercent: true,
animationDuration: 1000,
            center: Text(
              "${duration1.inMinutes.remainder(60).toString().padLeft(2,"0")}:${duration1.inSeconds.remainder(60).toString().padLeft(2,"0")}  "
            ,style: TextStyle(fontSize: 70,color: Colors.white),),
          ),
        ],
      ),
SizedBox(height:22),


isruning?

Row(
  mainAxisAlignment:MainAxisAlignment.center,
  children:[
   
ElevatedButton(onPressed: () { if(repeatedfunction!.isActive){
  setState(() {
    repeatedfunction!.cancel();
  });

}else{
  startTimer();
}

},
    child: Text((repeatedfunction!.isActive)?"stop timer":"resume")
   , style: ButtonStyle(backgroundColor:MaterialStateProperty.all(const Color.fromARGB(255, 193, 66, 108))),),

    
SizedBox(width:22),
   

  

ElevatedButton(onPressed: () { repeatedfunction!.cancel();
setState(() {
  duration1=Duration(minutes: 25);
  isruning=false;
});

 },
child:Text("cancel Studying") ,
style: ButtonStyle(backgroundColor:MaterialStateProperty.all(const Color.fromARGB(255, 193, 66, 108))),),

      ],
    )
     
  : ElevatedButton(onPressed: () { startTimer();
  setState(() {
    isruning=true;
  });
   },
child:Text("Start Studying") ,
style: ButtonStyle(backgroundColor:MaterialStateProperty.all(const Color.fromARGB(255, 193, 66, 108))),),

      
   ],
      ),
 
    
);
}
}