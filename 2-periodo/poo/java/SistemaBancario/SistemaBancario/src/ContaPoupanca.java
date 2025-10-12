public class ContaPoupanca extends Conta {

    public ContaPoupanca(String titular, int numeroConta, double saldo) {
        super(titular, numeroConta, saldo);
    }

    @Override
    public void sacar(double valor) {
        if (valor > saldo) {
            throw new IllegalArgumentException("Saldo insuficiente para saque!");
        }
        saldo -= valor;
    }

    @Override
    public void transferir(Conta destino, double valor) {
        if (valor > saldo) {
            throw new IllegalArgumentException("Saldo insuficiente para transferência!");
        }
        saldo -= valor;
        destino.depositar(valor);
    }
}
