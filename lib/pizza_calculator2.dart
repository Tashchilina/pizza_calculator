import 'package:flutter/material.dart';
import 'package:second_case/global_theme.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() => runApp(const SwitchesScreen());

class SwitchesScreen extends StatefulWidget {
  const SwitchesScreen({Key? key}) : super(key: key);

    @override
  _SwitchesScreenState createState() => _SwitchesScreenState();
}

enum sauce {hot, sweetandsour, cheese}
enum dough {ordinary,thin}

class _SwitchesScreenState extends State<SwitchesScreen> {
  bool _checked = true; //  сыр
  bool _isThinDough = false;//тесто
  sauce? _sauce = sauce.hot; //соус
   double _pizzaSize = 40; //размер
   int _cost = 150;
   int _calcCost(){
     _cost = _pizzaSize.round()+150;
     if (_isThinDough==true)_cost+=70;
     if (_checked==true)_cost+=90;

     switch(_sauce){
       case sauce.hot:
         _cost+=30;
         break;
       case sauce.sweetandsour:
         _cost+=50;
         break;
       case sauce.cheese:
         _cost+=70;
         break;
       case null:
         _sauce=sauce.hot;
         break;
     }
     return _cost;
    }


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
      theme: globalTheme(),
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
                      color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                Text(
                  'Выберите параметры:',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36)),
                             child: Center(
                               child: Padding(
                                 padding:EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
                                 child: SlidingSwitch(
                                     value: false,
                                     width: 380,
                                     onChanged: (bool value) {
                                       _isThinDough = value;
                                       setState(() {
                                         _calcCost();
                                       });
                                     },
                                   height: 34,
                                     animationDuration : const Duration(milliseconds: 200),
                                     onTap:(){},
                                     onDoubleTap:(){},
                                     onSwipe:() {},
                                     textOff : "Обычное тесто",
                                     textOn : "Тонкое тесто",
                                     colorOn : const Color(0xFFFFFFFF),
                                     colorOff : const Color(0xF0FFFFFF),
                                     background : const Color(0xFFECEFF1),
                                     buttonColor : const Color(0xFF0079D0),
                                     inactiveColor : const Color(0xFF636F7B),
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
                        SizedBox(width: 380,
                          child: SfSlider(
                              min: 20,
                              max: 60,
                              value: _pizzaSize,
                              interval: 20,
                              showTicks: true,
                              showLabels: true,
                              enableTooltip: false,
                              minorTicksPerInterval: 0,
                              stepSize: 20,
                              onChanged: (dynamic value){
                                setState(() {
                                  _pizzaSize=value;
                                  _calcCost();
                                });
                          })
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
                                      _calcCost();
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
                      SizedBox(
                        width: 380,
                        height: 34,
                        child: Card(
                          elevation: 0,
                          color: Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.0)),
                          child: Text('${_calcCost()} руб.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, color: Color(0xFF000000)),),
                        ),
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




