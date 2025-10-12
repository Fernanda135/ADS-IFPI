public class Quadrado extends Quadrilatero{

    double lado;

    public Quadrado(double lado) {
        super(lado, lado, lado, lado);
        this.lado = lado;
    }

    @Override
    public double perimetro() {
        return this.lado * 4;
    }

    @Override
    public double area() {
        return this.lado * this.lado;
    }

    @Override
    public String toString() {
        return "Quadrado";
    }

}
