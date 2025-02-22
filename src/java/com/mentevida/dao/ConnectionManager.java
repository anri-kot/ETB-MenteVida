package com.mentevida.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    // variables to assign properties to
    protected static String user;
    protected static String password;
    protected static String dburl;
    protected static String driver;
    
    protected static String sisO = System.getProperty("os.name").toLowerCase();
    
    protected static ConnectionManager connect; // receives the connection
    // starts connection if not started

    public static ConnectionManager getInstance() {
        if (connect == null) {
            return connect = new ConnectionManager();
        } else {
            return connect;
        }
        
    }

    // effectively starts connection
    public static Connection getConnection()
            throws ClassNotFoundException, SQLException, IOException {
        Properties prop = getProperties();

        // assigning properties to variables
        user = prop.getProperty("user");
        password = prop.getProperty("password");
        dburl = prop.getProperty("dburl");
        driver = prop.getProperty("driver");
        
        Class.forName(driver);
        return DriverManager.getConnection(dburl, user, password);
    }
    
    protected static Properties getProperties() throws IOException {
        Properties prop = new Properties();

        // Carregar propriedades com ClassLoader
        try (InputStream inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream("prop.properties")) {
            if (inputStream == null) {
                throw new FileNotFoundException("Properties file 'prop.properties' not found in classpath");
            }
            prop.load(inputStream);
        }
        
        return prop;
    }

    /* ---- get properties file
    protected static Properties getProperties() throws FileNotFoundException, IOException {
        Properties prop = new Properties();
        FileInputStream fIS = null;
        
        // Indique o diretório do arquivo propriedades no campo FileInputStream()
        
        if (sisO.startsWith("win")) {
            // Windows
            fIS = new FileInputStream(diretorioProjeto + "\\prop.properties");
        } else if (sisO.contains("linux")) {
            // Linux
            fIS = new FileInputStream(diretorioProjeto + "/prop.properties");
        } else {
            System.out.println("Sistema não suportado");
            fIS = null;
        }
        prop.load(fIS);
        return prop;
    }
     */
    public static String getUploads() throws IOException {
        Properties prop = getProperties();
        String dir = null;
        if (sisO.startsWith("win")) {
            dir = prop.getProperty("winuploads");
        } else if (sisO.contains("linux")) {
            dir = prop.getProperty("linuploads");
        }
        return dir;
    }
    
    public static String getDiretorio(String pasta) {
        String dir = null;
        if (sisO.startsWith("win")) {
            dir = "\\" + pasta + "\\";
        } else if (sisO.contains("linux")) {
            dir = "/" + pasta + "/";
        }
        return dir;
    }
}
