import 'package:exeo/services/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CGU extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: coulBlack,
      appBar: appBarReception(context),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("./assets/pictures/real_background.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleCgu(context),
              const Text(
                '''CONDITIONS GÉNÉRALES D'UTILISATION En vigueur au 1er avril 2023 Les présentes conditions générales d'utilisation (dites « CGU ») ont pour objet l'encadrement juridique des modalités de mise à disposition de l’application et des services par l’équipe EXEO et de définir
les conditions d’accès et d’utilisation des services par « l'Utilisateur ».
Les présentes CGU sont accessibles sur l'application dans la rubrique "Aspect juridique” des
paramètres.
Toute inscription ou utilisation de l'application implique l'acceptation sans aucune réserve ni
restriction des présentes CGU par l’utilisateur. Lors de l'inscription sur l'application via le Formulaire
d’inscription, chaque utilisateur accepte expressément les présentes CGU en cochant la case
précédant le texte suivant : « Je reconnais avoir lu et compris les CGU et je les accepte ».
En cas de non-acceptation des CGU stipulées dans le présent contrat, l'Utilisateur se doit de
renoncer à l'accès des services proposés par l'application.
L’équipe EXEO se réserve le droit de modifier unilatéralement et à tout moment le contenu des
présentes CGU.
Article 1 : Les mentions légales
L’édition et la direction de la publication de l'application EXEO est assurée par DULIN Emma,
CHENE Guillaume, PAQUENTIN Clément, ROY Olivier, TEIXEIRA Léo, CORTEZ Macarena,
domiciliés à Angers et ses alentours.
Adresse e-mail (mail exeo).
Le groupe est assujettie au RCS avec le numéro d'inscription XXXXXXXXXX et son numéro de TVA
intracommunautaire est le XXXXXXXXXX
L'hébergeur de l'application EXEO est playstore applestore, dont le siège social est situé à Angers,
avec le numéro de téléphone : 02 XXXXXXXX.
ARTICLE 2 : Accès à l’application
L'application EXEO permet à l'Utilisateur un accès gratuit aux services suivants :
L‘application propose les services suivants :
- Créer un compte client
- Accéder à leur espace client
- Accéder aux événements proposés
- Mettre en favoris
- Suivre des événements et autres utilisateurs...
L'application est accessible gratuitement en tout lieu à tout Utilisateur ayant un accès à Internet. Tous
les frais supportés par l'Utilisateur pour accéder au service (matériel informatique, logiciels, connexion
Internet, etc.) sont à sa charge.
Toutefois, Il est possible d’opter pour une version premium de l’application qui permet d’accéder à
plus de fonctionnalités. Voir modalités dans les conditions générales de vente.
L’Utilisateur non-membre n'a pas accès aux services réservés. Pour cela, il doit s’inscrire en
remplissant le formulaire. En acceptant de s’inscrire aux services réservés, l’Utilisateur membre
s’engage à fournir des informations sincères et exactes concernant son état civil et ses coordonnées,
notamment son adresse email. (Validation de l’adresse email par mail de confirmation)
Pour accéder aux services, l’Utilisateur doit ensuite s'identifier à l'aide de son identifiant et de son mot
de passe préalablement choisi par ses soins lors de son inscription.
Tout Utilisateur membre régulièrement inscrit pourra également solliciter sa désinscription en se
rendant à la page dédiée sur son espace personnel. Celle-ci sera effective dans un délai raisonnable.
Tout événement dû à un cas de force majeure ayant pour conséquence un dysfonctionnement de
l'application ou serveur et sous réserve de toute interruption ou modification en cas de maintenance,
n'engage pas la responsabilité de l’équipe entière d’EXEO et ses services. Dans ces cas, l’Utilisateur
accepte ainsi ne pas tenir rigueur à l’éditeur de toute interruption ou suspension de service, même
sans préavis.
L'Utilisateur a la possibilité de contacter l'équipe d’EXEO par messagerie électronique à l’adresse
email de l’éditeur communiqué à l’ARTICLE 1.
ARTICLE 3 : Collecte des données
L'application assure à l'Utilisateur une collecte et un traitement d'informations personnelles dans le
respect de la vie privée conformément à la loi n°78-17 du 6 janvier 1978 relative à l'informatique, aux
fichiers et aux libertés. L'application est déclarée à la CNIL sous le numéro XXXXXXXXXX.
En vertu de la loi Informatique et Libertés, en date du 6 janvier 1978, l'Utilisateur dispose d'un droit
d'accès, de rectification, de suppression et d'opposition de ses données personnelles. L'Utilisateur
exerce ce droit :
ARTICLE 4 : Propriété intellectuelle
Les marques, logos, signes ainsi que tous les contenus du site (textes, images, son…) font l'objet
d'une protection par le Code de la propriété intellectuelle et plus particulièrement par le droit d'auteur.
La marque EXEO est une marque déposée par DULIN Emma, CHENE Guillaume, PAQUENTIN
Clément, ROY Olivier, TEIXEIRA Léo, CORTEZ Macarena. Toute représentation et/ou reproduction
et/ou exploitation partielle ou totale de cette marque, de quelque nature que ce soit, est totalement
prohibée.
L'Utilisateur doit solliciter l'autorisation préalable du groupe EXEO pour toute reproduction,
publication, copie des différents contenus. Il s'engage à une utilisation des contenus de l'application
dans un cadre strictement privé, toute utilisation à des fins commerciales et publicitaires est
strictement interdite.
Toute représentation totale ou partielle de cette application par quelque procédé que ce soit, sans
l’autorisation expresse de l’exploitant de l'application constituerait une contrefaçon sanctionnée par
l’article L 335-2 et suivants du Code de la propriété intellectuelle.
Il est rappelé conformément à l’article L122-5 du Code de propriété intellectuelle que l’Utilisateur qui
reproduit, copie ou publie le contenu protégé doit citer l’auteur et sa source.
ARTICLE 5 : Responsabilité
Les sources des informations diffusées sur l'application EXEO sont réputées fiables mais l'application
ne garantit pas qu’il soit exempt de défauts, d’erreurs ou d’omissions.
Les informations communiquées sont présentées à titre indicatif et général sans valeur contractuelle.
Malgré des mises à jour régulières, l'application EXEO ne peut être tenu responsable de la
modification des dispositions administratives et juridiques survenant après la publication. De même,
l'application ne peut être tenue responsable de l’utilisation et de l’interprétation de l’information
contenue dans ce site.
L'Utilisateur s'assure de garder son mot de passe secret. Toute divulgation du mot de passe,
quelle que soit sa forme, est interdite. Il assume les risques liés à l'utilisation de son identifiant et mot
de passe. L'application décline toute responsabilité.
L'application EXEO ne peut être tenu pour responsable d’éventuels virus qui pourraient infecter le
mobile ou tout matériel informatique de l’Internaute, suite à une utilisation, à l’accès, ou au
téléchargement provenant du fournisseur.
La responsabilité de l'application et de l’équipe ne peut être engagée en cas de force majeure ou du
fait imprévisible et insurmontable d'un tiers.
ARTICLE 6 : Liens hypertextes
Des liens hypertextes peuvent être présents sur l'application. L’Utilisateur est informé qu’en cliquant
sur ces liens, il sortira de l'application EXEO et sera redirigé vers une nouvelle page internet. Cette
dernière n’a pas de contrôle sur les pages web sur lesquelles aboutissent ces liens et ne saurait, en
aucun cas, être responsable de leur contenu.
ARTICLE 7 : Récupération des données
L’Utilisateur accepte de manière tacite, lors de son inscription, que l’éditeur de l’application récupère
ses données et peut récupérer des informations sur sa navigation. Ces informations sont gardées
confidentielles par l’équipe d’EXEO et seront supprimées dans la mesure où l’utilisateur se désinscrit
et dans un délai de 24h.
Ces fichiers sont utilisés pour améliorer l’application d’EXEO.
En naviguant donc sur l'application, L’Utilisateur les accepte.
A défaut d’acceptation, l’Utilisateur est informé que l'accès à l’application lui sera prohibé.
ARTICLE 8 : Publication par l’Utilisateur
L'application permet aux membres de publier les contenus suivants :
- Des commentaires sur les activités et événements
Dans ses publications, le membre s’engage à respecter les règles de la Netiquette (règles de bonne
conduite de l’internet) et les règles de droit en vigueur.
L'application peut exercer une modération sur les publications et se réserve le droit de refuser leur
mise en ligne, sans avoir à s’en justifier auprès du membre.
Le membre reste titulaire de l’intégralité de ses droits de propriété intellectuelle.
Tout contenu mis en ligne par l'Utilisateur est de sa seule responsabilité. L'Utilisateur s'engage à ne
pas mettre en ligne de contenus pouvant porter atteinte aux intérêts de tierces personnes. Tout
recours en justice engagé par un tiers lésé contre l'application sera pris en charge par l'Utilisateur.
Le contenu de l'Utilisateur peut être à tout moment et pour n'importe quelle raison supprimé ou
modifié par le site, sans préavis.
ARTICLE 9 : Droit applicable et juridiction compétente
La législation française s'applique au présent contrat. En cas d'absence de résolution amiable d'un
litige né entre les parties, les tribunaux français seront seuls compétents pour en connaître.
Pour toute question relative à l’application des présentes CGU, vous pouvez joindre l’éditeur aux
coordonnées inscrites à l’ARTICLE 1.''',
                style: TextStyle(
                    color: coulWhite, fontFamily: fontHindMaduraiMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget titleCgu(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: coulWhite,
        ),
      ),
      const Center(
        child: Text(
          "Conditions générales d'utilisations",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, fontFamily: fontRubikMedium, color: coulWhite),
        ),
      ),
    ],
  );
}
