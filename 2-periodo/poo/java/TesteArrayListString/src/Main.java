import java.util.ArrayList;
import java.util.Scanner;


public class Main {
    public static void main(String[] args) {

        ArrayList<String> lista1 = new ArrayList();
        ArrayList<String> lista2 = new ArrayList();
        int i = 0;

        while (i < 10) {
            Scanner sc = new Scanner(System.in);
            System.out.println("Nome "+(i+1)+": ");
            String nome = sc.nextLine();

            lista1.add(nome);
            i+=1;
        }

        System.out.println("Lista 1 original: "+lista1.size());

        for (int n = 0; n < lista1.size(); n++) {
           if(lista1.get(n).length() < 3) {
               lista2.add(lista1.get(n));
           }
        }

        lista1.removeAll(lista2);

        System.out.println("Lista 1 final: "+lista1.size());
        System.out.println("Lista 2: "+lista2.size());



    }
}