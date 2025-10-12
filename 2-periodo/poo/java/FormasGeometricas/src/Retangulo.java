public class Retangulo extends Quadrilatero{

    double base;
    double altura;

    public Retangulo(double base, double altura) {
        super(base, altura, base, altura);
        this.base = base;
        this.altura = altura;
    }

    @Override
    public double perimetro() {
        return 2 * (this.base + this.altura);
    }

    @Override
    public double area() {
        return this.base * this.altura;
    }

    @Override
    public String toString() {
        return "Retângulo";
    }

}
