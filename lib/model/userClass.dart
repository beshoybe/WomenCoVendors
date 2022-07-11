class User {
  String Name = "";
  String Email = "";
  String Phone = "";
  String profileImageURL = "";

  User(
      {required String Name,
      required String Email,
      required String Phone,
      required String profileImageURL}) {
    this.Name = Name;
    this.Email = Email;
    this.Phone = Phone;
    this.profileImageURL = profileImageURL;
  }
}
