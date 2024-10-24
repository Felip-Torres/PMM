import 'dart:math';

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

// Clase abstracta Vehicle
abstract class Vehicle {
  late String matricula, marca, model, dniClient = "";
  bool llogat = false;
  int quilometratge = 0;

  Vehicle();
  Vehicle.matricula(this.matricula);
  Vehicle.completo(this.matricula, this.marca, this.model);

  // Metodos get
  String get getMatricula => matricula;
  String get getMarca => marca;
  String get getModel => model;
  String get getDniClient => dniClient;
  int get getQuilometratge => quilometratge;
  bool get estaLlogat => llogat;

  // Metodos set
  set setMatricula(String matricula) => this.matricula = matricula;
  set setMarca(String marca) => this.marca = marca;
  set setModel(String model) => this.model = model;
  set setDniClient(String dniClient) => this.dniClient = dniClient;
  set setQuilometratge(int quilometratge) => this.quilometratge = quilometratge;
  set setLlogat(bool llogat) => this.llogat=llogat;

  void llogar() {
    llogat = true;
  }

  void retornar() {
    llogat = false;
  }

  int compareTo(Vehicle other) {
    if (this.runtimeType != other.runtimeType) {
      throw Exception("No se pueden comparar vehicles de tipos diferentes.");
    }
    return this.quilometratge.compareTo(other.quilometratge);
  }
}

// Clase Cotxe
class Cotxe extends Vehicle {
  Cotxe();
  Cotxe.matricula(String matricula): super.matricula(matricula);
  Cotxe.completo(String matricula, String marca, String model): super.completo(matricula, marca, model);

  @override
  String toString() {
    return 'Cotxe(Matricula: $matricula, Marca: $marca, Model: $model, Llogat: $llogat, DNI Client: $dniClient, Quilometratge: $quilometratge)';
  }
}

// Clase Moto
class Moto extends Vehicle {
  late int cilindrada;

  Moto();
  Moto.matricula(String matricula): super.matricula(matricula);
  Moto.completo(String matricula, String marca, String model, this.cilindrada): super.completo(matricula, marca, model);

  @override
  String toString() {
    return 'Moto(Matricula: $matricula, Marca: $marca, Model: $model, Cilindrada: $cilindrada, Llogat: $llogat, DNI Client: $dniClient, Quilometratge: $quilometratge)';
  }
}

void main() {
  // Creacion de listas de cotxes y motos
  List<Cotxe> cotxes = [];
  List<Moto> motos = [];

  // Creacion de 5 cotxes
  cotxes.add(Cotxe.completo('1234ABC', 'Toyota', 'Corolla'));
  cotxes.add(Cotxe.completo('5678DEF', 'Honda', 'Civic'));
  cotxes.add(Cotxe.completo('9101GHI', 'Ford', 'Focus'));
  cotxes.add(Cotxe.completo('1121JKL', 'Mazda', '3'));
  cotxes.add(Cotxe.completo('3141MNO', 'Nissan', 'Leaf'));

  // Creacion de 5 motos
  motos.add(Moto.completo('KLMN123', 'Yamaha', 'YZF-R1', 1000));
  motos.add(Moto.completo('OPQR456', 'Kawasaki', 'Ninja', 650));
  motos.add(Moto.completo('STUV789', 'Ducati', 'Panigale', 1100));
  motos.add(Moto.completo('WXYZ012', 'Suzuki', 'GSX-R', 750));
  motos.add(Moto.completo('ABCD345', 'BMW', 'S1000RR', 999));

  // Creacion de clients
  Client client1 = Client.complet('12345678A', 'John Doe', 'johndoe@example.com', '123456789', '1111222233334444');
  Client client2 = Client.complet('87654321B', 'Jane Smith', 'janesmith@example.com', '987654321', '4444333322221111');

  //Simulo alquileres
  cotxes[0].llogar();
  cotxes[0].setDniClient = client1.getDNI;
  cotxes[1].llogar();
  cotxes[1].setDniClient = client1.getDNI;
  cotxes[2].llogar();
  cotxes[2].setDniClient = client2.getDNI;
  motos[0].llogar();
  motos[0].setDniClient = client2.getDNI;

  //Cuento cotxes alquilados
  int cont=0;
  for (Cotxe cotxe in cotxes){
    if(cotxe.estaLlogat)cont++;
  }
  print("Cotxes total: ${cotxes.length} llogat: ${cont}");

  //Cuento motos alquiladas
  cont=0;
  for (Moto moto in motos){
    if(moto.estaLlogat)cont++;
  }
  print("Motos total: ${motos.length} llogat: ${cont}");

  //Creo una instancia de Random
  Random random = Random();
  //Assigno quilometrajes aleatorios a los cotxes
  for (Cotxe cotxe in cotxes){
    cotxe.setQuilometratge = random.nextInt(1001);
  }
  //Assigno quilometrajes aleatorios a las motos
  for (Moto moto in motos){
    moto.setQuilometratge = random.nextInt(1001);
  }

  //Cogo el cotxe con mas quilometraje
  Cotxe cotxeMax=cotxes[0];
  for(int i=1; i<cotxes.length; i++){
    if(cotxes[i].getQuilometratge>cotxeMax.getQuilometratge)cotxeMax=cotxes[i];
  }

  //Cogo la moto con mas quilometraje
  Moto motoMax=motos[0];
  for(int i=1; i<motos.length; i++){
    if(motos[i].getQuilometratge>motoMax.getQuilometratge)motoMax=motos[i];
  }

  print("Cotxe con mas quilometros");
  print(cotxeMax);

  print("\nMoto con mas quilometros");
  print(motoMax);
}
