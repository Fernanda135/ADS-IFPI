public class Main {
    public static void main(String[] args) throws SaldoException {

        Conta c1 = new Conta(100);

        try {
            c1.sacar(20);
            System.out.println("Saque de realizado com sucesso!");
        } catch (Exception e) {
            System.out.println("Erro no saque: " + e.getMessage());
        }

    }
}