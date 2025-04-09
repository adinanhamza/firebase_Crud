class studentModel{
  String? id;
  String name;
  String studentClass;
  String address;
  String age;

  studentModel({required this.address, this.id,required this.name,required this.studentClass,required this.age});

  Map<String,dynamic>toDataBase(){
    return {
'id' : id,
'name': name,
'studentClass' : studentClass,
'address' : address,
'age' : age
    };
  }


  factory studentModel.fromDataBase(Map<String,dynamic>json,String id){
    return studentModel(
      id: id,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      studentClass: json['studentClass'] ?? '',
      age: json['age']
          );
  }
}