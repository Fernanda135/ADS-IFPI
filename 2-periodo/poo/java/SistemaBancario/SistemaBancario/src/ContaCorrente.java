public class ContaCorrente extends Conta {
    private static final double TAXA = 10.0;

    public ContaCorrente(String titular, int numeroConta, double saldo) {
        super(titular, numeroConta, saldo);
    }

    @Override
    public void sacar(double valor) {
        if (valor + TAXA > saldo) {
            throw new IllegalArgumentException("Saldo insuficiente para saque (incluindo taxa)!");
        }
        saldo -= (valor + TAXA);
    }

    @Override
    public void transferir(Conta destino, double valor) {
        if (valor + TAXA > saldo) {
            throw new IllegalArgumentException("Saldo insuficiente para transferência (incluindo taxa)!");
        }
        saldo -= (valor + TAXA);
        destino.depositar(valor);
    }
}
