import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
 int pessoas = 0;
  void decrement(){
    setState(() {
    pessoas--;
    });
    print(pessoas);
  }
  void increment(){
    setState(() {
      pessoas++;
    });
    print(pessoas);
  }
  bool get isEmpty => pessoas ==0;
  bool get isFull => pessoas ==20;
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 231, 177, 2),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.jpg'),
            fit: BoxFit.cover,
          ),
          ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
         Text(
           isFull ? 'Lotado' : 'Pode entrar!', 
            style: TextStyle(
                fontSize: 40, 
                color: isFull ? Colors.red : Color.fromARGB(251, 214, 151, 5),
                fontWeight: FontWeight.bold,
              ),
            ),
         Padding(padding: const EdgeInsets.all(60),
         child: Text('$pessoas', 
          style: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.normal,
            color: isFull ? Colors.red : Color.fromARGB(251, 214, 151, 5),
          ),
          ),
         ),
          
          //Linha dos botões
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.white.withOpacity(0.5) : Colors.white,
                    fixedSize: const Size(100, 50),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                ),
                onPressed: isEmpty ? null : decrement, 
                child: Text('Saiu',
                style: TextStyle(
                  fontSize: 20,
                  color: isEmpty ? Colors.red.withOpacity(0.5) :  Color.fromARGB(251, 214, 151, 5),
                  ),
                ),
                ),
                const SizedBox(width: 16),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: isFull ?Colors.white.withOpacity(0.5) : Colors.white,
                    fixedSize: const Size(100, 50),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                onPressed: isFull ? null : increment,
                child: Text('Entrou',
                    style: TextStyle(
                      fontSize: 20,
                      color:isFull ? Colors.red.withOpacity(0.5) : Color.fromARGB(251, 214, 151, 5),
                      ),
                  ),
                ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}