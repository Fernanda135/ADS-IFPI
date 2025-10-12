public class Main {
    public static void main(String[] args) {

        Animal animal1 = new Cachorro();        Animal animal2 = new Cavalo();
        Animal animal3 = new Pregica();

        Animal[] animais = new Animal[10];

        animais[0] = animal1;
        animais[1] = animal2;
        animais[2] = animal3;

        int i = 0;
        while (animais[i] != null){
            animais[i].emitirSom();
            i++;
        }

    }

}