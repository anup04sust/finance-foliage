<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'affiliate-alliance' );

/** Database username */
define('DB_USER', 'devteam');

/** Database password */
define('DB_PASSWORD', 'devteam127');

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '@8E!/R!NWZ?Z:~7 y9/p8XXDpW@TGbnv9HN_QO1s]Ub/z]SrMY9^GQw#W0VN0yfl' );
define( 'SECURE_AUTH_KEY',  'zA+0zWb1,!*P]96!R)bQk/&-~BY.{$D4N%K=MA3W#q5AIP[85rulSr]IHBe2s0wS' );
define( 'LOGGED_IN_KEY',    'Z^.Iqm`{FA%x%[jbCtAO:*zE9v{^#GN@q!v23GiX%goOIR8W@fr D/S)7{93/[HE' );
define( 'NONCE_KEY',        '{(m$W;e``MHO5e`G8N}-}%cy}z60 Je*oj1FiGcOE396I;1J?H4b~El#]{3iJgJ)' );
define( 'AUTH_SALT',        'S[b`a${b&t5&m#.]FV79^O8F3iT*kca&[w7Uf!:1vizcI->q6P5EB}]HLix^<5}5' );
define( 'SECURE_AUTH_SALT', '< qyKa=4o=~z0f6pp$0N<#4Rd <KZ2i!biFx]k_09ZILsq`^#f?BD~Xpd0>7%J%)' );
define( 'LOGGED_IN_SALT',   'U87zAUCX~9r>4vHkCNm$i>8/~irIH}DDp@<]p=<347&L#r.*oBx7oAx3UC,+A/o.' );
define( 'NONCE_SALT',       'V&)Dn}{,(OYwpTAbz4p8-b=j=atH8*  0V.g</M`C?Qo/,j.l3EGZo!Qn.Gl%Yx@' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'aa_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */

define('FS_METHOD','direct');

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

