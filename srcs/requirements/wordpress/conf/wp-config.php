<?php

/** Nom de la base de données de WordPress. */
define('DB_NAME', getenv('SQL_DATABASE'));

/** Utilisateur de la base de données MySQL. */
define('DB_USER', getenv('MYSQL_USER'));

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', getenv('MYSQL_PASSWORD'));

/** Adresse de l’hébergement MySQL. */
define('DB_HOST', 'mariadb:3306');
/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define('DB_CHARSET', 'utf8');

/** Type de collation de la base de données.
  * N’y touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clés secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '-F?[,SJU%Y5>?lcy6`? .N)jW0C8,oA533M?*rJrzEY (El+:2p,wR#HEIJt[<,f');
define('SECURE_AUTH_KEY',  'cT:|bZ^!(Vrq(9bn^(LppZ{chxmGN-[x> wkIxOzfO<w-T)++ep5c|D tL6|D-i`');
define('LOGGED_IN_KEY',    'E@Si-m#FBV0fyL.{q3[m|y|bj^N)rl/`j^oV!F*k-}|aXuv-YKLkC,3620Xd+q6?');
define('NONCE_KEY',        'cH,j[-/?eVsCA@zRMfl=sZw}bHyl7#/v^0IsTZZ<y#x+]Z)0+BjsNdRrs*lyZ[R2');
define('AUTH_SALT',        'F[}=yMf*[3NVwGN+BK1f`~5.b26Kk^R+fk8|t7C7+Mo;E>Tr^4=]tB.e*o`X0>t+');
define('SECURE_AUTH_SALT', '2aK_tA$J+Waa*:2B!]rqRc2|I-^4+_{9,y(tuHU6^hL#qP+F`%g7>KtG8mk9jSv/');
define('LOGGED_IN_SALT',   '_LAvZ2g149J9Itl$[YX.BxvRar2o#Rs2GJV`|vAh;-B`}{zbS=h-,v:N]D_l]plk');
define('NONCE_SALT',       '_/^qR/M.fK0Grw:lwzj[S|}+15~?gu>.r7An|D!rG%?U.gkt#Nb1 i!|Z}Wv.@`o');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

define('WP_DEBUG', false);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');
