import controlador.CtrLogin;
import modelo.DatosCompartidos;
import vistas.VistaLogin;

public class Principal {
        public static void main(String[] args) {
            DatosCompartidos dc = new DatosCompartidos();
            VistaLogin vl = new VistaLogin();
            new CtrLogin(vl, dc);
            vl.setVisible(true);
        }
    }