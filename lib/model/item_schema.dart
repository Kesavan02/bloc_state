
class Item {
  int id;
  String firstName;
  String lastName;
  String maidenName;
  int age;
  String gender;
  String email;
  String phone;
  String username;
  String password;
  DateTime birthDate;
  String image;
  String bloodGroup;
  double height;
  double weight;
  String eyeColor;
  Hair hair;
  String ip;
  Address address;
  String macAddress;
  String university;
  Bank bank;
  Company company;
  String ein;
  String ssn;
  String userAgent;
  Crypto crypto;
  String role;

  Item({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      address: Address(
        address: json['address']['address'], 
        city: json['address']['city'], 
        state: json['address']['state'], 
        stateCode: json['address']['stateCode'], 
        postalCode: json['address']['postalCode'], 
        coordinates: Coordinates(
          lat: json['address']['coordinates']['lat'], 
          lng: json['address']['coordinates']['lng']), 
        country: json['address']['country']), 
      id: json['id'],
      age: json['age'],
      bank: Bank(
        cardExpire: json['bank']['cardExpire'], 
        cardNumber: json['bank']['cardNumber'], 
        cardType: json['bank']['cardType'], 
        currency: json['bank']['currency'], 
        iban: json['bank']['iban']), 
      firstName: json['firstName'], 
      lastName: json['lastName'], 
      maidenName: json['maidenName'], 
      gender: json['gender'], 
      email: json['email'], 
      phone: json['phone'], 
      username: json['userName'], 
      password: json['password'], 
      birthDate: json['birthDate'], 
      image: json['image'], 
      bloodGroup: json['bloodGroup'], 
      height: json['height'], 
      weight: json['weight'], 
      eyeColor: json['eyeColor'], 
      hair: Hair(
        color: json['Hair']['color'], 
        type: json['Hair']['type']), 
      ip: json['ip'], 
      macAddress: json['macAddress'], 
      university: json['university'], 
      company: Company(
        department: json['company']['department'], 
        name: json['company']['name'], 
        title: json['company']['title'], 
        address: Address(
          address: json['company']['address']['address'], 
          city: json['company']['address']['city'], 
          state: json['company']['address']['state'], 
          stateCode: json['company']['address']['stateCode'], 
          postalCode: json['company']['address']['postalCode'], 
          coordinates: Coordinates(
            lat: json['company']['address']['coordinates']['lat'], 
            lng: json['company']['address']['coordinates']['lng']), 
          country: json['company']['address']['country'])), 
      ein: json['ein'], 
      ssn: json['ssn'], 
      userAgent: json['userAgent'], 
      crypto: Crypto(
        coin: json['crypto']['coin'], 
        wallet: json['crypto']['wallet'], 
        network: json['crypto']['network']), 
      role: json['role'],);
  }

}

class Hair {
  String color;
  String type;

  Hair({required this.color, required this.type});
}

class Address {
  String address;
  String city;
  String state;
  String stateCode;
  String postalCode;
  Coordinates coordinates;
  String country;

  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });
}

class Coordinates {
  double lat;
  double lng;

  Coordinates({required this.lat, required this.lng});
}

class Bank {
  String cardExpire;
  String cardNumber;
  String cardType;
  String currency;
  String iban;

  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });
}

class Company {
  String department;
  String name;
  String title;
  Address address;

  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });
}

class Crypto {
  String coin;
  String wallet;
  String network;

  Crypto({required this.coin, required this.wallet, required this.network});
}
