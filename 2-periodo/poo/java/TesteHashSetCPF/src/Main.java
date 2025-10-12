import java.util.HashSet;
import java.util.Scanner;


public class Main {
    public static void main(String[] args) {

        HashSet<String> cpf = new HashSet<>();

        int i = 0;

        while (i < 10) {
            Scanner sc = new Scanner(System.in);
            System.out.println("CPF: ");
            String c = sc.nextLine();

            cpf.add(c);

            i+=1;
        }

        for (Object o : cpf) {
            System.out.println("CPF: "+o);
        }

    }
}