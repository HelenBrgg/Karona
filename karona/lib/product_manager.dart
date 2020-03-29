import 'package:flutter/material.dart';
import './products_lib.dart';

class ProductManager extends StatefulWidget
{

  final String startingproduct;
  ProductManager(this.startingproduct);
  @override
  State<StatefulWidget> createState()
  {
    //TODO: implement createState
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager>
{
  List<String> _products = [];

  @override
  void initState()
  {
    _products.add(widget.startingproduct);
    super.initState();
  }


  @override
  Widget build(BuildContext context)
  {
    return Column(children:[

  Container(
    margin: EdgeInsets.all(10.0),
    child:RaisedButton(
    onPressed:(){
      setState(() {
        _products.add('SuperFood');       
                          });

    },
    child:Text('So press me!'),
  ),
  ),
    Products(_products)],
    );
  }
}








