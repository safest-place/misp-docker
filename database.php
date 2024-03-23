<?php
class DATABASE_CONFIG {

        public $default = array(
                'datasource' => 'Database/Mysql',
                //'datasource' => 'Database/Postgres',
                'persistent' => false,
                'host' => '',
                'login' => '',
                'port' => 6865, // MySQL & MariaDB
                //'port' => 5432, // PostgreSQL
                'password' => '',
                'database' => 'misp',
                'prefix' => '',
                'encoding' => 'utf8',
        );
}
?>

