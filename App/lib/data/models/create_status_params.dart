class CreateStatusParams {
  final String age;
  final String sex;
  final String chestPainType;
  final int restingBpS;
  final String exerciseAngina;

  CreateStatusParams(
      {required this.age,
      required this.sex,
      required this.chestPainType,
      required this.restingBpS,
      required this.exerciseAngina});
  Map<String, dynamic> toJson() => {
        "age": age,
        "sex": sex,
        "chest pain type": chestPainType,
        "resting bp s": restingBpS,
        "exercise angina": exerciseAngina
      };
}
