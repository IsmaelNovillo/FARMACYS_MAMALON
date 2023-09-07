    package vistas;
    import javax.swing.*;

    public class VistaLogin extends JFrame{
        public JPanel panelLogin;
        public JTextField usuariotextField;
        public JButton ingresarButton;
        public JComboBox rolComboBox;
        public JLabel imagenFARMACY;
        public JPasswordField contrasenaField;

        public VistaLogin() {
            setContentPane(panelLogin);
            pack();
            setTitle("INICIO DE SESION");
            setLocation(100,100);
            setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        }

    }
