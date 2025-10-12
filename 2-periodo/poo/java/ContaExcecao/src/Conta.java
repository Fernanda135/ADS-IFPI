public class Conta{

    double saldo;

    public Conta(double saldo) {
        this.saldo = saldo;
    }

    public double sacar(double valor) throws SaldoException {
        if(valor > this.saldo) {
            throw new SaldoException("Saldo insuficiente! Saldo atual: " + this.saldo);
        } else {
            this.saldo -= valor;
            return this.saldo;
        }
    }

    public double depositar(double valor) {
        this.saldo += valor;
        return  this.saldo;
    }

}
