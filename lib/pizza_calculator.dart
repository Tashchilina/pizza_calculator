import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
enum sauce {hot, sweetandsour, cheese}
sauce? _sauce = sauce.hot;
bool _checked = true;

void setState(Null Function() param0) {
}

void _onsauceChange (sauce? value) {
  setState(() {
    _sauce=value;
  });
}

  void _onCheckedChange(bool? val) {
    setState(() {
      _checked = !_checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(
            color: const Color(0xFFeceff1), width: 2),
      );

      return MaterialApp(
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 20,),
                const SizedBox(width: 230,
                  height: 120,
                  child: Image(image: AssetImage('assets/pizza 1.png')),),
                SizedBox(height: 30,),
                Text('Калькулятор пиццы', style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000)),),
                SizedBox(height: 9,),
                Text('Выберите параметры:', style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000)),),
                SizedBox(height: 30,),
                Container(width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFFECEFF1),
                      borderRadius: BorderRadius.circular(36)),
                  child: Row(
                      children: [
                        Expanded(child: ElevatedButton(onPressed: () {},
                          child: Text('Обычное тесто',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFFeceff4)),),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0079D0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0),
                            ),
                          ),
                        )
                        ),
                        Expanded(child: ElevatedButton(onPressed: () {},
                          child: Text('Тонкое тесто', style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, 0.4)),),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFECEFF1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(36.0),
                            ),
                          ),
                        ),
                        ),
                      ]),
                ),
                SizedBox(height: 19,),
                Text('Размер:', style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF000000)),),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFECEFF1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                  ),
                ),
                SizedBox(height: 10,),

                Text('Соус:',
                  style: TextStyle(fontSize: 18, color: Color(0xFF333333)),),
                RadioListTile <sauce>(
                    title: const Text('Острый', textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16, color: Color(0xFF333333)),),
                    value: sauce.hot,
                    groupValue: _sauce,
                    onChanged: _onsauceChange
                ),
                RadioListTile <sauce>(
                    title: const Text(
                      'Кисло-сладкий', textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16, color: Color(0xFF333333)),),
                    value: sauce.sweetandsour,
                    groupValue: _sauce,
                    onChanged: _onsauceChange
                ),
                RadioListTile <sauce>(
                    title: const Text('Сырный', textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16, color: Color(0xFF333333)),),
                    value: sauce.cheese,
                    groupValue: _sauce,
                    onChanged: _onsauceChange
                ),
                SizedBox(height: 15,),

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(width: 36, height: 34,
                        child: Image(image: AssetImage('assets/cheese.png')),),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text('Дополнительный сыр', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF263238)),),
                    ),
                    Expanded(
                      flex: 1,
                      child: Switch(value: _checked, onChanged: (val) {
                    setState(() {
                    _checked = !_checked;
                    });
                    })
                      ),
                    ] ),
                SizedBox(height: 10,),
                Text('Стоимость:', style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF000000)),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFECEFF1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                  ),
                ),

                SizedBox(height: 30,),
                SizedBox(width: 154, height: 42, child:
                ElevatedButton(onPressed: () {},
                  child: Text('Заказать', style: TextStyle(fontSize: 16),),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0079D0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                ),
                ),
                SizedBox(height: 30,),
              ]),
            ),
          ),
        ),
      );
    }
  }

