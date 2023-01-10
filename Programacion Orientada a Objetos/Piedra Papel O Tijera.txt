package desafio1;

import java.util.Scanner;

public class Main {
    /*
      Hacé un programa que te permita jugar a “Piedra, papel o tijera”. En primer lugar, la
      aplicación solicita el nombre de cada gamer, después empieza el juego. El juego consiste
      en pedir qué opción elije cada uno y sumar puntos al winner —si lo hay—. Definí y utilizá
      una función llamada cualGana con dos parámetros con las jugadas de cada uno, que
      devuelve 0 en caso de empate, 1 si gana el primero, 2 si gana el segundo. El juego termina
      cuando el primero elije “*” como indicador de final.
   */

    public static void main(String[] args) {
        comenzarJuego();
    }


    public static void comenzarJuego() {
        String nombreJugador1 = "";
        int puntosJugador1 = 0;
        String nombreJugador2 = "";
        int puntosJugador2 = 0;

        Scanner scanner = new Scanner(System.in);
        //Pido y cargo los nombres de los jugadores
        System.out.println("Ingrese el nombre del primer jugador:");
        nombreJugador1 = scanner.nextLine();

        System.out.println("Ingrese el nombre del segundo jugador:");
        nombreJugador2 = scanner.nextLine();

        //Los jugadores eligen sus jugadas
        String opcionUno = "";
        String opcionDos = "";
        while(!opcionUno.equals("*")) {
            System.out.println("Jugador uno elija su jugada:");
            System.out.println("1 -> piedra");
            System.out.println("2 -> papel");
            System.out.println("3 -> tijeras");
            System.out.println("* -> terminar el juego");
            opcionUno = scanner.nextLine();
            if(!opcionUno.equals("*")) {
                System.out.println("Jugador dos elija su jugada:");
                System.out.println("1 -> piedra");
                System.out.println("2 -> papel");
                System.out.println("3 -> tijeras");
                opcionDos = scanner.nextLine();

                if(cualGana(opcionUno,opcionDos) == 1) {
                    System.out.println("Gano el jugador 1 esta ronda");
                    puntosJugador1++;
                }
                else if(cualGana(opcionUno,opcionDos) == 2) {
                    System.out.println("Gano el jugador 2 esta ronda");
                    puntosJugador2++;
                }
                else {
                    System.out.println("Empate esta ronda");
                }
            }

        }

        elegirGanadorPartido(nombreJugador1,nombreJugador2,puntosJugador1,puntosJugador2);
    }

    private static int cualGana(String opcionUno, String opcionDos) {
        //Gana el jugador 1
        if(opcionUno.equals("1") && opcionDos.equals("3")) {
            return 1;
        }
        else if(opcionUno.equals("2") && opcionDos.equals("1")) {
            return 1;
        }
        else if(opcionUno.equals("3") && opcionDos.equals("2")) {
            return 1;
        }

        //Gana el jugador 2
        if(opcionDos.equals("1") && opcionUno.equals("3")) {
            return 2;
        }
        else if(opcionDos.equals("2") && opcionUno.equals("1")) {
            return 2;
        }
        else if(opcionDos.equals("3") && opcionUno.equals("2")) {
            return 2;
        }

        //Empatan
        return 0;
    }

    private static void elegirGanadorPartido(String nombreJugador1, String nombreJugador2, int puntosJugador1, int puntosJugador2) {
        if(puntosJugador1 > puntosJugador2) {
            System.out.println("Gano el jugador " + nombreJugador1 + " el partido");
        }
        else if(puntosJugador1 < puntosJugador2) {
            System.out.println("Gano el jugador " + nombreJugador2 + " el partido");
        }
        else {
            System.out.println("El partido termino en un empate");
        }
    }

}
