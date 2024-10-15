abstract class Treballador{
    late int id;
    late String nom;
    late num sou, retencio;

    static int nextId = 1;
    Treballador(this.nom, this.sou, this.retencio): this.id=nextId++;

    void imprimirNom() => print('Nom:\t${this.nom}');

    void souNet() => print('Sou:\t${this.sou * (100 - this.retencio)/100}');
}

class Administratiu extends Treballador{
    Administratiu(nom,sou,retencio): super(nom, sou, retencio);
}

class Comercial extends Treballador{
    late num ventes, comissio;
    Comercial(nom, sou, retencio, this.ventes, this.comissio): super(nom, sou, retencio);

    @override
    void souNet() => print('Sou:\t${(this.sou+this.ventes*this.comissio) * (100 - this.retencio)/100}');
}

void main(){
    Administratiu maria = new Administratiu('Maria', 1900*12, 21);
    Comercial aina= new Comercial("Aina", 1300*12, 21, 150, 40);

    List<Treballador> treballadors = [aina, maria];

    for (var treballador in treballadors){
        treballador.imprimirNom();
        treballador.souNet();
    }
}