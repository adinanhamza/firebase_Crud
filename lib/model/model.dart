class studentModel{
  String id;
  String name;
  String studentClass;
  String address;

  studentModel({required this.address,required this.id,required this.name,required this.studentClass});

  Map<String,dynamic>toDataBase(){
    return {

    };
  }
}