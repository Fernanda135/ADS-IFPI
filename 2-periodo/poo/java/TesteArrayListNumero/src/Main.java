import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        ArrayList<Integer> l = new ArrayList<Integer>();
        int i = 0;

        while (i < 10) {
            Scanner sc = new Scanner(System.in);
            System.out.println("Item "+(i+1)+": ");
            Integer n = sc.nextInt();
            if(n == 10 || n == 100 || n == 1000) {
                System.out.println("Bônus de R$50,00");
            }

            l.add(n);
            i += 1;

        }

        System.out.println("Tamanho da lista: "+l.size());

        for (Object o : l) {
            System.out.println("Item: "+o);
        }

    }
}