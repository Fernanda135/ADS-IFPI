import java.util.HashMap;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        HashMap<String, Aluno> mapaAlunos = new HashMap<>();

        Aluno aluno1 = new Aluno("001", "Ana", 9.5, "Fisica");
        Aluno aluno2 = new Aluno("002", "Carlos", 8.2, "Matemática");
        Aluno aluno3 = new Aluno("003", "Maria", 7.8, "Química");
        Aluno aluno4 = new Aluno("004", "Fernanda", 7.0, "ADS");
        Aluno aluno5 = new Aluno("005", "Jõao", 6.8, "Administração");



        mapaAlunos.put(aluno1.getMatricula(), aluno1);
        mapaAlunos.put(aluno2.getMatricula(), aluno2);
        mapaAlunos.put(aluno3.getMatricula(), aluno3);
        mapaAlunos.put(aluno4.getMatricula(), aluno4);
        mapaAlunos.put(aluno5.getMatricula(), aluno5);

        Scanner sc = new Scanner(System.in);
        System.out.println("Matrícula do aluno: ");
        String busca = sc.nextLine();

        if(mapaAlunos.get(busca) != null) {
            System.out.println("Aluno encontrado:");
            System.out.println("Nome: " + mapaAlunos.get(busca).getNome());
            System.out.println("IRA: " + mapaAlunos.get(busca).getIra());
            System.out.println("Curso: " + mapaAlunos.get(busca).getCurso());
        } else {
            System.out.println("Aluno não encontrado.");
        }


    }
}