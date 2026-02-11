<?php

/**
 * Conn.class [ CONEXÃO ]
 * Classe abstrata de conexão. Padrão SingleTon.
 * Retorna um objeto PDO pelo método estático getConn();
 * 
 * @copyright (c) 2017, Robson V. Leite UPINSIDE TECNOLOGIA
 * @license http://pro.workcontrol.com.br?p=6089 Alisson Pereira Santana
 */
class Conn {

    private static $Host = SIS_DB_HOST;
    private static $User = SIS_DB_USER;
    private static $Pass = SIS_DB_PASS;
    private static $Dbsa = SIS_DB_DBSA;
    private static $Port = null;

    /** @var PDO */
    private static $Connect = null;

    /**
     * Conecta com o banco de dados com o pattern singleton.
     * Retorna um objeto PDO!
     */
    private static function Conectar() {
        try {
            if (self::$Connect == null):
                // Prefer configured constants, but fall back to common env var names in containers.
                $host = self::$Host ?: (getenv('SIS_DB_HOST') ?: (getenv('DB_HOST') ?: getenv('MYSQL_HOST')));
                $user = self::$User ?: (getenv('SIS_DB_USER') ?: (getenv('DB_USER') ?: getenv('MYSQL_USER')));
                $pass = self::$Pass ?: (getenv('SIS_DB_PASS') ?: (getenv('DB_PASS') ?: getenv('MYSQL_PASSWORD')));
                $dbsa = self::$Dbsa ?: (getenv('SIS_DB_DBSA') ?: (getenv('DB_DATABASE') ?: getenv('MYSQL_DATABASE')));
                $port = self::$Port ?: (getenv('SIS_DB_PORT') ?: (getenv('DB_PORT') ?: getenv('MYSQL_PORT')));
                $port = ($port ? (int) $port : 3306);

                if (empty($host) || empty($dbsa)) {
                    throw new PDOException('Database not configured: set SIS_DB_HOST and SIS_DB_DBSA (and SIS_DB_USER/SIS_DB_PASS).');
                }

                // "localhost" triggers unix socket on many setups; force TCP when local.
                if ($host === 'localhost') {
                    $host = '127.0.0.1';
                }

                $dsn = "mysql:host={$host};port={$port};dbname={$dbsa};charset=utf8mb4";
                $options = [
                    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8mb4',
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                ];
                self::$Connect = new PDO($dsn, $user, $pass, $options);
            endif;
        } catch (PDOException $e) {
            PHPErro($e->getCode(), $e->getMessage(), $e->getFile(), $e->getLine());
            die;
        }

        return self::$Connect;
    }

    /** Retorna um objeto PDO Singleton Pattern. */
    public static function getConn() {
        return self::Conectar();
    }

    /**
     * Construtor do tipo protegido previne que uma nova instância da
     * Classe seja criada através do operador `new` de fora dessa classe.
     */
    private function __construct() {
        
    }

    /**
     * Método clone do tipo privado previne a clonagem dessa instância
     * da classe
     *
     * @return void
     */
    private function __clone() {
        
    }

    /**
     * Método unserialize do tipo privado para previnir que desserialização
     * da instância dessa classe.
     *
     * @return void
     */
    private function __wakeup() {
        
    }

}
