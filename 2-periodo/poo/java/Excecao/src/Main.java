import java.util.Scanner;


public class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        boolean loop = true;
        while (loop) {
            try {
                System.out.println("Número: ");
                int n = sc.nextInt();

                int quadN = n * n;
                System.out.println("O número " + n + " ao quadrado é: " + quadN);
                loop = false;
            } catch (Exception e) {
                System.out.println("Opa.. Acho que você se enganou! Digite novamente...");
                sc.nextLine();
            }
        }

    }
}