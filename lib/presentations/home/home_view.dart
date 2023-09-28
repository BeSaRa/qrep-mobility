
import 'package:flutter/material.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key,  this.title = 'press'});
  final String title ;
  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:  TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Theme.of(context).primaryColor,),
        body:Column(children: [
           TextButton(onPressed: ()async{

           }, child: Text("press",style: TextStyle(color: Theme.of(context).colorScheme.tertiary),)),
Container(
  height: 40,
  width: 100,
  color: Theme.of(context).colorScheme.tertiaryContainer,)

        ],)
      ),
    );
  }


}
