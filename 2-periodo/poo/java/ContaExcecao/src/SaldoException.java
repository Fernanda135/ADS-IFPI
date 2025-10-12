public class SaldoException extends Exception {
    public SaldoException(String mensagem) {
        super(mensagem);
    }

    @Override
    public String getMessage() {
        return "Erro na operação: " + super.getMessage();
    }
}