class FormModel {
  String username;
  String password;
  String sex;
  Map<String, bool> courses;
  double tuition;

  FormModel({
    this.username = '',
    this.password = '',
    this.sex = 'Male',
    Map<String, bool>? courses,
    this.tuition = 2500.0,
  }) : courses = courses ??
      {
        'Machine Learning': true,
        'Full stack': true,
        'Mobile application': false,
      };

  void reset() {
    username = '';
    password = '';
    sex = 'Male';
    courses.updateAll((key, value) => false);
    tuition = 0.0;
  }
}