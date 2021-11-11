import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? mathsController,literatureController, englishController;
  double diemTrungBinh=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathsController= TextEditingController();
    literatureController= TextEditingController();
    englishController= TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Điểm học tập'),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                textInputWidget(labelText: "Điểm toán", hintText: "Nhập điểm toán vào đây", controller: mathsController),
                textInputWidget(labelText: "Điểm văn", hintText: "Nhập Điểm văn vào đây", controller: literatureController),
                textInputWidget(labelText: "Điểm tiếng anh ", hintText: "Nhập Điểm tiếng anh vào đây", controller: englishController ),
                ElevatedButton(
                    onPressed: (){
                      if(mathsController!.text.isEmpty || literatureController!.text.isEmpty || englishController!.text.isEmpty ){  const snackBar =  SnackBar(
                          content: Text('Mời nhập đầy đủ thông tin'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else if(validated(a: mathsController!.text)==false ){  const snackBar =  SnackBar(
                          content: Text('vui lòng nhập lại điểm'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      else{
                        setState(() {
                          diemTrungBinh= tinhDiemTrungBinh(toan:double.parse(mathsController!.text), van: double.parse(literatureController!.text), anh: double.parse(englishController!.text));
                        });
                        showAlertDialog(context);
                      }
                      // hàm
                    },
                    child: const Text('Xác Nhận')),
              ],
            ),
          ),
        )

    );
  }
  Widget textInputWidget({ required String labelText, required String  hintText, required controller}){
    return Container(
        padding: const EdgeInsets.only(top:10.0, bottom: 5.0),
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
          ),
          controller: controller,
        )
    );
  }
  Widget informationCard({required String label, required String content}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(label,style: const TextStyle(fontSize:15, fontWeight:FontWeight.bold),),
      Text(content, style: const TextStyle(fontSize:15, fontWeight:FontWeight.bold))
      ],
    );
  }
  void showAlertDialog(BuildContext context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: const Text("Bảng điểm học tập"),
        content: Container(
          width: MediaQuery.of(context).size.width/1.2,
          height: MediaQuery.of(context).size.height/4,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              informationCard(label: "điểm toán:", content: mathsController!.text), const Padding(padding: EdgeInsets.all(3)),
              informationCard(label: "điểm văn:", content: literatureController!.text), const Padding(padding: EdgeInsets.all(3)),
              informationCard(label: "điểm tiếng anh:", content: englishController!.text), const Padding(padding: EdgeInsets.all(3)),
              informationCard(label: "điểm trung bình:", content: diemTrungBinh.toString()),const Padding(padding: EdgeInsets.all(3)),
              informationCard(label: "xếp loại:", content: xepLoai(diemTB: diemTrungBinh))
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      );
    });
  }

  double tinhDiemTrungBinh({required double toan,required double van,required double anh}){
    double a= ((toan+ van+ anh)/3) ;
    return a;
  }
  String xepLoai({required double diemTB}){
    String xepLoai;
    if(diemTB<5){
      return xepLoai="Yếu";
    }
    else if(diemTB<6.5){
      return xepLoai="Trung bình";
    }
    else if(diemTB<8.5){
      return xepLoai="Khá";
    }else{
     return xepLoai="Giỏi";
    }
  }
  bool validated({required var a}){
    final regExp=RegExp(r'^[0-9]');
    if(regExp.hasMatch(a.trim()) && double.parse(a)>=0 && double.parse(a)<=10) {
      return true;
    }else{
      return false;}
  }
}
