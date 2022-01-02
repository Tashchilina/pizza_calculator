import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

void main() => runApp(const SwitchesScreen());

class SwitchesScreen extends StatefulWidget {
  const SwitchesScreen({Key? key}) : super(key: key);

    @override
  _SwitchesScreenState createState() => _SwitchesScreenState();
}

enum sauce {hot, sweetandsour, cheese}
enum dough {ordinary,thin}

class _SwitchesScreenState extends State<SwitchesScreen> {
  sauce? _sauce = sauce.hot;
  bool _checked = true;
  dough? _dough = dough.ordinary;
  int ordinary = 350;
  int thin = 370;
  int currentRangeValues = 30;
  int currentRangeValues2 = 50;
  int currentRangeValues3 = 70;
  int cheese = 50;
  RangeValues _currentRangeValues = const RangeValues(0, 60);


  void _onsauceChange(sauce? value) {
    setState(() {
      _sauce = value;
    });
  }
  void _onCheckedChange(bool? val) {
    setState(() {
      _checked = !_checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(color: Color(0xFFeceff1), width: 2),
    );
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: 230,
                    height: 120,
                    child: Image(image: AssetImage('assets/pizza 1.png')),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Калькулятор пиццы',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000)),
                ),
                const SizedBox(
                  height: 9,
                ),
                const Text(
                  'Выберите параметры:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: [
                        Container(                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36)),
                             child: Center(
                               child: Padding(
                                 padding:EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                                 child: SlidingSwitch(
                                     value: false,
                                     width: 380,
                                     onChanged: (bool value) {
                                       print(value);
                                     },
                                   height: 34,
                                     animationDuration : const Duration(milliseconds: 400),
                                     onTap:(){
                                       setState(() {
                                         _dough = dough.ordinary;
                                       });
                                     },
                                     onDoubleTap:(){
                                       setState(() {
                                     _dough = dough.thin;
                                     });
                                     },
                                     onSwipe:() {},
                                     textOff : "Обычное тесто",
                                     textOn : "Тонкое тесто",
                                     colorOn : const Color.fromRGBO(0, 0, 0, 0.4),
                                     colorOff : const Color(0xFFFFFFFF),
                                     background : const Color(0xFFECEFF1),
                                     buttonColor : const Color(0xFF0079D0),
                                     inactiveColor : const Color.fromRGBO(0, 0, 0, 0.4),
                                   ),
                               ),
                             ),
                             ),
                        const SizedBox(
                          height: 19,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Размер:',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000)),
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          width: 380,
                          height: 34,
                          decoration: BoxDecoration(
                            color: Color(0xFFECEFF1),
                            borderRadius: BorderRadius.circular(36)),
                          child: Padding(padding:EdgeInsets.only(top: 25.0),
                            child: RangeSlider(
                            values: _currentRangeValues,
                            max: 60,
                            divisions: 3,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                            setState(() {
                            _currentRangeValues = values;
                            });
                     },
                    ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Соус:',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333)),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 6),
                          child: Column(
                              children: [
                                GestureDetector(onTap: (){
                                  setState(() {
                                    _sauce = sauce.hot;
                                  });
                                },
                                  child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[
                                        const Text('Острый', textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 16, color: Color(0xFF333333)),),
                                        Radio <sauce>(
                                          value: sauce.hot,
                                          groupValue: _sauce,
                                          onChanged: _onsauceChange,
                                          activeColor: Color(0xFF5DB075),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: const VisualDensity(
                                            horizontal: VisualDensity.minimumDensity,
                                            vertical: VisualDensity.minimumDensity,),
                                        ),
                                      ]),
                                ),
                                const Divider(),
                              ]),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 6),
                          child: Column(
                              children: [
                                GestureDetector(onTap: (){
                                  setState(() {
                                    _sauce = sauce.sweetandsour;
                                  });
                                },
                                  child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[
                                        const Text('Кисло-сладкий',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 16, color: Color(0xFF333333)),),
                                        Radio<sauce>(
                                          value: sauce.sweetandsour,
                                          groupValue: _sauce,
                                          onChanged: _onsauceChange,
                                          activeColor: Color(0xFF5DB075),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: const VisualDensity(
                                            horizontal: VisualDensity.minimumDensity,
                                            vertical: VisualDensity.minimumDensity,),
                                        ),
                                      ]),
                                ),
                                const Divider(),
                              ]),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 6),
                          child: Column(
                              children: [
                                GestureDetector(onTap: (){
                                  setState(() {
                                    _sauce = sauce.cheese;
                                  });
                                },
                                  child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:[
                                        const Text('Сырный', textAlign: TextAlign.right, style: TextStyle(
                                            fontSize: 16, color: Color(0xFF333333)),),
                                        Radio<sauce>(
                                          value: sauce.cheese,
                                          groupValue: _sauce,
                                          onChanged: _onsauceChange,
                                          activeColor: Color(0xFF5DB075),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          visualDensity: const VisualDensity(
                                            horizontal: VisualDensity.minimumDensity,
                                            vertical: VisualDensity.minimumDensity,),
                                        ),
                                      ]),
                                ),
                                const Divider(),
                              ]),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(children: [
                          const Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 36,
                              height: 34,
                              child:
                              Image(image: AssetImage('assets/cheese.png')),
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: Text(
                              'Дополнительный сыр',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xFF263238)),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Switch(
                                  value: _checked,
                                  onChanged: (val) {
                                    setState(() {
                                      _checked = !_checked;
                                    });
                                  })),
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Стоимость:',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      Container(
                        width: 380, height: 34,
                      decoration: BoxDecoration(
                        color: Color(0xFFECEFF1),
                        borderRadius: BorderRadius.circular(36)),
                      ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 154,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Заказать',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF0079D0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
        ),
      ),
      ),
    );
  }
}




