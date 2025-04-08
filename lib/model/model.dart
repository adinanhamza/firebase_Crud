class studentModel{
  String? id;
  String name;
  String studentClass;
  String address;

  studentModel({required this.address, this.id,required this.name,required this.studentClass});

  Map<String,dynamic>toDataBase(){
    return {
'id' : id,
'name': name,
'studentClass' : studentClass,
'address' : address,
    };
  }


  factory studentModel.fromDataBase(Map<String,dynamic>json,String id){
    return studentModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      studentClass: json['studentClass'] ?? ''
          );
  }
}