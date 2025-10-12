public abstract class Conta {
    protected String titular;
    protected int numeroConta;
    protected double saldo;

    public Conta(String titular, int numeroConta, double saldo) {
        this.titular = titular;
        this.numeroConta = numeroConta;
        this.saldo = saldo;
    }

    public String getTitular() {
        return titular;
    }

    public int getNumeroConta() {
        return numeroConta;
    }

    public double getSaldo() {
        return saldo;
    }

    public void depositar(double valor) {
        if (valor <= 0) {
            throw new IllegalArgumentException("Valor inválido para depósito!");
        }
        saldo += valor;
    }

    public abstract void sacar(double valor);

    public abstract void transferir(Conta destino, double valor);
}
