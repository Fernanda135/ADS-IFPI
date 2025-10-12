public class Circulo implements Forma{

    double raio;

    public Circulo(double raio) {
        this.raio = raio;
    }

    @Override
    public double perimetro() {
        return 2 * Math.PI * this.raio;
    }

    @Override
    public double area() {
        return Math.PI * (this.raio * this.raio);
    }

    @Override
    public String toString() {
        return "Círculo";
    }
}
