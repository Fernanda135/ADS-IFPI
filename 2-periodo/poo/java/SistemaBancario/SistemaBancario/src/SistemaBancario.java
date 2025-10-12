import java.util.ArrayList;
import java.util.Scanner;

public class SistemaBancario {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        ArrayList<Conta> contas = new ArrayList<>();

        contas.add(new ContaCorrente("Luís", 1, 500));
        contas.add(new ContaCorrente("Thiago", 2, 500));
        contas.add(new ContaCorrente("Idelmar", 3, 500));
        contas.add(new ContaPoupanca("Vinicius", 4, 500));
        contas.add(new ContaPoupanca("Fernanda", 5, 500));
        contas.add(new ContaPoupanca("Katelyn", 6, 500));

        int opcao;
        do {
            System.out.println("\n=== Menu Banco ===");
            System.out.println("1 - Depositar");
            System.out.println("2 - Sacar");
            System.out.println("3 - Transferir");
            System.out.println("4 - Ver Saldo");
            System.out.println("5 - Listar Contas");
            System.out.println("0 - Sair");
            System.out.print("Escolha: ");
            opcao = sc.nextInt();

            try {
                switch (opcao) {
                    case 1 -> {
                        System.out.print("Número da conta: ");
                        int numero = sc.nextInt();
                        Conta conta = buscarConta(contas, numero);
                        System.out.print("Valor: ");
                        double valor = sc.nextDouble();
                        conta.depositar(valor);
                        System.out.println("Depósito realizado com sucesso!");
                    }
                    case 2 -> {
                        System.out.print("Número da conta: ");
                        int numero = sc.nextInt();
                        Conta conta = buscarConta(contas, numero);
                        System.out.print("Valor: ");
                        double valor = sc.nextDouble();
                        conta.sacar(valor);
                        System.out.println("Saque realizado com sucesso!");
                    }
                    case 3 -> {
                        System.out.print("Número da conta origem: ");
                        int origem = sc.nextInt();
                        Conta contaOrigem = buscarConta(contas, origem);

                        System.out.print("Número da conta destino: ");
                        int destino = sc.nextInt();
                        Conta contaDestino = buscarConta(contas, destino);

                        System.out.print("Valor: ");
                        double valor = sc.nextDouble();

                        contaOrigem.transferir(contaDestino, valor);
                        System.out.println("Transferência realizada com sucesso!");
                    }
                    case 4 -> {
                        System.out.print("Número da conta: ");
                        int numero = sc.nextInt();
                        Conta conta = buscarConta(contas, numero);
                        System.out.println("Saldo de " + conta.getTitular() + ": R$ " + conta.getSaldo());
                    }
                    case 5 -> listarContas(contas); // nova opção
                    case 0 -> System.out.println("Fim !");
                    default -> System.out.println("Opção inválida!");
                }
            } catch (Exception e) {
                System.out.println("Erro: " + e.getMessage());
            }

        } while (opcao != 0);

        sc.close();
    }

    private static Conta buscarConta(ArrayList<Conta> contas, int numero) {
        for (Conta c : contas) {
            if (c.getNumeroConta() == numero) {
                return c;
            }
        }
        throw new IllegalArgumentException("Conta não encontrada!");
    }

    private static void listarContas(ArrayList<Conta> contas) {
        System.out.println("\n=== Lista de Contas ===");
        for (Conta c : contas) {
            System.out.println("Número da Conta: " + c.getNumeroConta() +
                    ", Titular: " + c.getTitular() +
                    ", Saldo: R$ " + c.getSaldo());
        }
    }
}
