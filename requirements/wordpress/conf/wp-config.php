<?php
 // ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('SQL_DATABASE'));

/** Database username */
define( 'DB_USER', getenv('SQL_USER'));

/** Database password */
define( 'DB_PASSWORD', getenv('SQL_PASSWORD'));

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );
