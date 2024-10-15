// Clase Client
class Client {
  late String DNI, nom, correu, telefon, numTargeta;

  // Constructor con DNI y nom
  Client(this.DNI, this.nom);

  // Constructor con todos los atributos
  Client.complet(this.DNI, this.nom, this.correu, this.telefon, this.numTargeta);

  // Metodos get
  String get getDNI => DNI;
  String get getNom => nom;
  String get getCorreu => correu;
  String get getTelefon => telefon;
  String get getNumTargeta => numTargeta;

  // Metodos set
  set setDni(String DNI) => this.DNI = DNI;
  set setNom(String nom) => this.nom = nom;
  set setCorreu(String correu) => this.correu = correu;
  set setTelefon(String telefon) => this.telefon = telefon;
  set setNumTargeta(String numTargeta) => this.numTargeta = numTargeta;

  // Sobreescritura del toString
  @override
  String toString() {
    return 'Client(DNI: $DNI, Nom: $nom, Correu: $correu, Telefon: $telefon, Targeta: $numTargeta)';
  }
}

// Classe abstracta Vehicle
abstract class Vehicle {
  bool llogat;
  late String dniClient, model, marca, matricula;
  int quilometratge;

  Vehicle(this.matricula, this.marca, this.model)
      : llogat = false,
        quilometratge = 0;

  void llogar(String dni) {
    llogat = true;
    dniClient = dni;
  }

  void retornar() {
    llogat = false;
    dniClient = null;
  }

  bool estaLlogat() => llogat;

  int compareTo(Vehicle other) {
    if (this.runtimeType != other.runtimeType) {
      throw Exception("No es poden comparar vehicles de tipus diferent.");
    }
    return this.quilometratge.compareTo(other.quilometratge);
  }

  @override
  String toString();
}

// Classe Cotxe
class Cotxe extends Vehicle {
  Cotxe(String matricula, String marca, String model)
      : super(matricula, marca, model);

  @override
  String toString() {
    return 'Cotxe(Matricula: $matricula, Marca: $marca, Model: $model, Llogat: $llogat, DNI Client: $dniClient, Quilometratge: $quilometratge)';
  }
}

// Classe Moto
class Moto extends Vehicle {
  int cilindrada;

  Moto(String matricula, String marca, String model, this.cilindrada)
      : super(matricula, marca, model);

  @override
  String toString() {
    return 'Moto(Matricula: $matricula, Marca: $marca, Model: $model, Cilindrada: $cilindrada, Llogat: $llogat, DNI Client: $dniClient, Quilometratge: $quilometratge)';
  }
}

// Aplicació executable
void main() {
  // Creació de llistes de cotxes i motos
  List<Cotxe> cotxes = [];
  List<Moto> motos = [];

  // Creació de 5 cotxes
  cotxes.add(Cotxe('1234ABC', 'Toyota', 'Corolla'));
  cotxes.add(Cotxe('5678DEF', 'Honda', 'Civic'));
  cotxes.add(Cotxe('9101GHI', 'Ford', 'Focus'));
  cotxes.add(Cotxe('1121JKL', 'Mazda', '3'));
  cotxes.add(Cotxe('3141MNO', 'Nissan', 'Leaf'));

  // Creació de 5 motos
  motos.add(Moto('KLMN123', 'Yamaha', 'YZF-R1', 1000));
  motos.add(Moto('OPQR456', 'Kawasaki', 'Ninja', 650));
  motos.add(Moto('STUV789', 'Ducati', 'Panigale', 1100));
  motos.add(Moto('WXYZ012', 'Suzuki', 'GSX-R', 750));
  motos.add(Moto('ABCD345', 'BMW', 'S1000RR', 999));

  // Creació de clients
  Client client1 = Client('12345678A', 'John Doe', 'johndoe@example.com', '123456789', '1111222233334444');
  Client client2 = Client('87654321B', 'Jane Smith', 'janesmith@example.com', '987654321', '4444333322221111');

  // Llogar vehicles
  cotxes[0].llogar(client1.dni);
  cotxes[2].llogar(client2.dni);
  motos[1].llogar(client1.dni);
  motos[3].llogar(client2.dni);

  // Contar vehicles llogats
  int cotxesLlogats = cotxes.where((cotxe) => cotxe.estaLlogat()).length;
  int motosLlogades = motos.where((moto) => moto.estaLlogat()).length;

  // Mostrar quantitat total de vehicles llogats
  print('Cotxes llogats: $cotxesLlogats');
  print('Motos llogades: $motosLlogades');

  // Indicar el cotxe i la moto amb més quilòmetres
  Cotxe? cotxeMesQuilometres;
  Moto? motoMesQuilometres;

  for (var cotxe in cotxes) {
    if (cotxe.quilometratge > (cotxeMesQuilometres?.quilometratge ?? -1)) {
      cotxeMesQuilometres = cotxe;
    }
  }

  for (var moto in motos) {
    if (moto.quilometratge > (motoMesQuilometres?.quilometratge ?? -1)) {
      motoMesQuilometres = moto;
    }
  }

  // Mostrar informació del cotxe i moto amb més quilòmetres
  print('Cotxe amb més quilòmetres: ${cotxeMesQuilometres.toString()}');
  print('Moto amb més quilòmetres: ${motoMesQuilometres.toString()}');
}
