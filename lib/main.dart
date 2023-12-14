import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class User{
  int age;
  String pol;
  int weight;
  int height;
  List<User> listOfUsers;

  User(this.age,this.pol, this.weight, this.height, this.listOfUsers);
}

class WaterData {
  final String year;
  final double liters;

  WaterData(this.year, this.liters);
}
List<User> listOfUsers = [];

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
      ),
      home: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

    final _ageController = TextEditingController();
    final _polController = TextEditingController();
    final _weightController = TextEditingController();
    final _heightController = TextEditingController();

    int ageValue = 0;
    String polValue = "";
    int weightValue = 0;
    int heightValue = 0;


    void addUser(BuildContext context, int ageValue, String polValue, int weightValue, int heightValue) {
      for(int i = 0; i < listOfUsers.length; i++) {

        if(polValue == listOfUsers[i].age)
        {
          User newObj = User(ageValue, polValue, weightValue, heightValue, listOfUsers[i] as List<User>);
          listOfUsers[i].listOfUsers.add(newObj);
        }
      }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.blue.shade200,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.indigoAccent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.supervised_user_circle),
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'Вход',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.auto_graph),
            icon: Icon(Icons.auto_graph_outlined),
            label: 'График',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.info),
            icon: Icon(Icons.info_outlined),
            label: 'Инфо',
          ),
        ],
      ),

       body:<Widget>[
         ///user page
          Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.indigoAccent,
                    child: Text(
                      'Добро пожаловать!',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                ),
                Card(
                  color: Colors.indigoAccent,
                      child: Image.asset ("assets/images/water.png", width: 300, height: 150,)
                  ),
                Card(
                  color: Colors.indigoAccent,
                  child: ListTile(
                        title: Column(
                             children: <Widget>[
                              TextField(
                               decoration: const InputDecoration(
                                hintText: "Возраст",
                                 ),
                                  controller: _ageController,
                          ),
                          TextField(
                              decoration: const InputDecoration(
                                hintText: "Пол",
                                 ),
                                controller: _polController,
                          ),
                          TextField(
                                decoration: const InputDecoration(
                                  hintText: "Вес",
                                  ),
                                  controller: _weightController,
                          ),
                          TextField(
                              decoration: const InputDecoration(
                                hintText: "Рост",
                                 ),
                                 controller: _heightController,
                          ),
                               FloatingActionButton(
                                backgroundColor: Colors.blue.shade200,
                                onPressed: () {
                                 if(_ageController.text != ""
                                    && _polController.text != ""
                                      && _weightController.text != ""
                                       && _heightController.text != ""){
                                       final snackBar = SnackBar(
                                        content: Text("Данные добавлены"));
                                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          ageValue = _ageController.text as int;
                                           polValue = _polController.text;
                                            weightValue =_weightController.text as int;
                                            heightValue = _heightController.text as int;
                                            addUser(context, ageValue, polValue, weightValue, heightValue);
                                             setState(() {});
                                             _ageController.clear();
                                              _polController.clear();
                                              _weightController.clear();
                                               _heightController.clear();
                                                Navigator.of(context).pop();
                                               }},
                                   child: Text(
                                    "+",
                                    style: TextStyle(
                                     color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26),
                                    ),
                        ),
                               const Text(
                                 'Добавьте свои параметры',
                                     style: TextStyle(
                                    color: Colors.white,),),
    ],
     ),
      ),
    ),
                Card(
                  color: Colors.indigoAccent,
                  child: Text(
                    'возраст     пол     вес     рост',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

        /// home page
          Container(
            margin: EdgeInsets.only(top: 100),
            color: Colors.indigoAccent,
            child: Column(
            children: <Widget>[
              Text(
                'Сегодня вы выпили',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  ),
                ),
              Card(
                color: Colors.blue.shade200,
                 child: Column(
                    children: <Widget>[
                      Text(
                       '$_counter',
                      style: TextStyle(
                      fontSize: 29,
                      color: Colors.white,
                        ),
                    ),
                ],
                ),
              ),
              Card(
                color: Colors.indigoAccent,
                margin: EdgeInsets.all(45),
                child: ListTile(
                  leading: FloatingActionButton(
                    backgroundColor: Colors.blue.shade200,
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: Text(
                      "+",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                  ),
                  title: Text('Добавьте стакан выпитой воды'),
                  textColor: Colors.white,
                ),
              ),
              Card(
                  color: Colors.indigoAccent,
                  margin: EdgeInsets.all(52),
                  child: Image.asset ("assets/images/water.png", width: 290, height: 140),
              ),
              ],
            ),
          ),

          /// diagramm page
               Container(
                 color: Colors.white,
                   child: SfCartesianChart(
                       primaryXAxis: CategoryAxis(),
                       series: <LineSeries<WaterData, String>>[
                         LineSeries<WaterData, String>(
                             dataSource:  <WaterData>[
                               WaterData('Jan', 35),
                               WaterData('Feb', 48),
                               WaterData('Mar', 34),
                               WaterData('Apr', 32),
                               WaterData('May', 32),
                               WaterData('June', 55),
                               WaterData('Jule', 22),
                               WaterData('Agst', 42),
                               WaterData('Sep', 32),
                               WaterData('Oct', 32),
                               WaterData('Nov', 41),
                               WaterData('Dec', 40)
                             ],
                             xValueMapper: (WaterData water, _) => water.year,
                             yValueMapper: (WaterData water, _) => water.liters,
                             dataLabelSettings: DataLabelSettings(isVisible: true)
                         )
                       ]
                   )
              ),

         /// info page
        Container(
          padding: EdgeInsets.only(top:25, left:10, right:10),
          color: Colors.indigoAccent,
          child: Column(children: <Widget>[
               Text(
                'Факты о воде:',
                 textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              ),
               ),
              Text(
            '1. Примерно 70% планеты Земля покрыто водой. Но только 1% этой воды пригоден для питья!',
        textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
                  ),
              Text(
            '2. Большинство людей выпивает недостаточное количество воды в день, не говоря уже о ее качестве.',
        textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
      ),
              Text(
            '3. Как утверждают медики и психологи, достаточно выпить 2 стакана чистой воды, чтобы преодолеть депрессию и усталость.',
        textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                ),
      ),
            Text(
            '4. По мнению врачей, вода помогает повысить давление.',
        textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
      ),
            Text(
            '5. Человек за всю свою жизнь выпивает в среднем 35 тонн воды.',
        textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
      ),
    ],
    ),
          ),
      ] [currentPageIndex],
    );
  }
}
