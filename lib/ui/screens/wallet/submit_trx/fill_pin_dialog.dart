import 'package:selendra_marketplace_app/all_export.dart';

class FillPin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FillPinState();
  }
}

class FillPinState extends State<FillPin> {

  TextEditingController _pinPutController = TextEditingController();

  FocusNode _pinNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      // border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.grey.withOpacity(0.5)
    );
  }

  BoxConstraints get boxConstraint {
    return  BoxConstraints(minWidth: 40, minHeight: 50);
  }

  @override
  initState(){
    _pinPutController.clear();
    _pinNode.requestFocus();
    super.initState();
  }

  @override
  void dispose(){
    _pinPutController.clear();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: MyText(
        top: 16,
        bottom: 16,
        text: "Fill your pin ",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(right: 13,bottom: 20),
            child: PinPut(
              obscureText: '⚪',
              focusNode: _pinNode,
              controller: _pinPutController,
              fieldsCount: 4,
              eachFieldMargin: EdgeInsets.only(left: 13),

              selectedFieldDecoration: _pinPutDecoration.copyWith(
                color: Colors.grey.withOpacity(0.5),
                border: Border.all(color: Colors.grey, width: 1)
              ),

              submittedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration,

              eachFieldConstraints: boxConstraint,
              textStyle: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
              onSubmit: (value){
                Navigator.pop(context, value);
              },
            ),
          ),
          
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: MyText(
                text: "Close"
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}