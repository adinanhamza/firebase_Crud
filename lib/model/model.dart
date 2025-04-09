class StudentModel{
  String? id;
  String name;
  String studentClass;
  String address;
  String age;

  StudentModel({required this.address, this.id,required this.name,required this.studentClass,required this.age});

  Map<String,dynamic>toDataBase(){
    return {
'id' : id,
'name': name,
'studentClass' : studentClass,
'address' : address,
'age' : age
    };
  }


  factory StudentModel.fromDataBase(Map<String,dynamic>json,String id){
    return StudentModel(
      id: id,
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      studentClass: json['studentClass'] ?? '',
      age: json['age']
          );
  }
}