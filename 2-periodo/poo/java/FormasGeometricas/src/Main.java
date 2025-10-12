import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Forma> formas = new ArrayList<>();

        System.out.print("Quantidade de formas: ");
        int qtdformas = sc.nextInt();
        sc.nextLine();

        for (int i = 0; i < qtdformas; i++) {
            System.out.println("\nForma " + (i + 1) + ":");
            System.out.print("Escolha uma forma (quadrado, retangulo ou circulo): ");
            String tipoForma = sc.nextLine().toLowerCase();

            switch (tipoForma) {
                case "quadrado":
                    System.out.print("Tamanho do lado: ");
                    double lado = sc.nextDouble();
                    sc.nextLine();
                    formas.add(new Quadrado(lado));
                    break;

                case "retangulo":
                    System.out.print("Base: ");
                    double base = sc.nextDouble();
                    System.out.print("Altura: ");
                    double altura = sc.nextDouble();
                    sc.nextLine();
                    formas.add(new Retangulo(base, altura));
                    break;

                case "circulo":
                    System.out.print("Raio: ");
                    double raio = sc.nextDouble();
                    sc.nextLine();
                    formas.add(new Circulo(raio));
                    break;

                default:
                    System.out.println("Tipo inválido!");
                    i--;
                    break;
            }
        }

        System.out.println("\nPerímetros das formas:");
        for (int i = 0; i < formas.size(); i++) {
            Forma forma = formas.get(i);
            System.out.printf("Forma %d (%s): Perímetro = %.2f%n",
                    i + 1, forma.toString(), forma.perimetro());
        }

        System.out.println("\nÁreas das formas:");
        for (int i = 0; i < formas.size(); i++) {
            Forma forma = formas.get(i);
            System.out.printf("Forma %d (%s): Área = %.2f%n",
                    i + 1, forma.toString(), forma.area());
        }
    }
}