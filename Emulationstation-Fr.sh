#!/bin/bash
#================================== #
#  Script de correction du fichier  #
#      de traduction française      #
#        d'EmulationStation         #
#            By Jason               #
# ================================= #

# --- Vérification des droits root ---
if [ "$EUID" -ne 0 ]; then
    exec sudo "$0" "$@"
fi

# --- Configuration ---
TARGET_FILE="/usr/bin/emulationstation/resources/locale/fr/emulationstation2.po"
ES_SERVICE="emulationstation"
LOG_FILE="/var/log/emustation_correction.log"

echo "Lancement de la correction EmulationStation - $(date) ===" | tee -a "$LOG_FILE"
sleep 1

# --- Vérification du fichier ---
if [ ! -f "$TARGET_FILE" ]; then
    echo "Fichier non trouvé : $TARGET_FILE" | tee -a "$LOG_FILE"
sleep 2
    exit 1
fi
echo "Fichier trouvé." | tee -a "$LOG_FILE"
sleep 1

# --- Espace de travail temporaire ---
WORK_DIR=$(mktemp -d)
trap 'rm -rf "$WORK_DIR"' EXIT
LOCAL_FILE="$WORK_DIR/emulationstation2.po"
cp "$TARGET_FILE" "$LOCAL_FILE"
echo "Copie locale créée : $LOCAL_FILE" | tee -a "$LOG_FILE"
sleep 1

# --- Application des corrections ---
echo "Application des corrections..." | tee -a "$LOG_FILE"
sleep 1

# Corrections a apporter 
sed -i \
-e 's/msgstr "PASSONS À LA DÉCENNIE"/msgstr "ALLER À LA DÉCENNIE"/' \
-e 's/msgstr "ÉCRAN DE VEUILLE"/msgstr "ÉCRAN DE VEILLE"/' \
-e 's/msgstr "Temps joués"/msgstr "Parties jouées"/' \
-e 's/msgstr "TEMPS JOUÉES, ASCENDANT"/msgstr "PARTIES JOUÉES, ASCENDANT"/' \
-e 's/msgstr "TEMPS JOUÉES, DÉCROISSANT"/msgstr "PARTIES JOUÉES, DÉCROISSANT"/' \
-e 's/msgstr "Édition de la collection '\''%s'\'' terminer."/msgstr "Édition de la collection '\''%s'\'' terminée."/' \
-e 's/msgstr "Ajouter '\''%s'\'' à '\''%s'\''"/msgstr "'\''%s'\'' ajouté à '\''%s'\''"/' \
-e 's/msgstr "Supprimer '\''%s'\'' de '\''%s'\''"/msgstr "'\''%s'\'' supprimé de '\''%s'\''"/' \
-e 's/msgstr "SCRAPE TERMINÉ. ACTUALISER LA MISE À JOUR DE LA LISTE DES JEUX POUR APPLIQUER LES MODIFICATIONS"/msgstr "SCRAPING TERMINÉ. METTEZ À JOUR LA LISTE DES JEUX POUR APPLIQUER LES MODIFICATIONS."/' \
-e 's/msgstr "PARAMÈTRES DE LA COLLECTION DE JEU"/msgstr "PARAMÈTRES DES COLLECTIONS DE JEUX"/' \
-e 's/msgstr "SCRAPE EN COURS. VOULEZ-VOUS L'\''ARRÊTER "/msgstr "SCRAPING EN COURS. VOULEZ-VOUS L'\''ARRÊTER ?"/' \
-e 's/msgstr "MENU GRAPHIQUE QUAND LE VOLUME CHANGES"/msgstr "MENU GRAPHIQUE LORSQUE LE VOLUME CHANGE"/' \
-e 's/msgstr "FEMININE"/msgstr "FÉMININE"/' \
-e 's/msgstr "Verbal BATTERY Voice"/msgstr "Voix pour l'\''alerte de batterie"/' \
-e 's/msgstr "TONALITÉ DE LA VOIX DE LA BATTERIE"/msgstr "VOIX POUR L'\''ALERTE DE BATTERIE"/' \
-e 's/msgstr "Verbal BATTERY Warning"/msgstr "Alerte de batterie faible"/' \
-e 's/msgstr "TONALITÉ BATTERIE FAIBLE"/msgstr "ALERTE DE BATTERIE FAIBLE"/' \
-e 's/msgstr "STYLE D'\''AFFICHAGE DE LA LISTE DE JEU"/msgstr "STYLE D'\''AFFICHAGE DE LA LISTE DE JEUX"/' \
-e 's/msgstr "détaillée"/msgstr "détaillé"/' \
-e 's/msgstr "simple"/msgstr "basique"/' \
-e 's/msgstr "RÉINITIALISER LA LISTE DE JEU PERSONNALISÉ"/msgstr "RÉINITIALISER LES LISTES DE JEUX PERSONNALISÉES"/' \
-e 's/msgstr "AFFICHER L'\''HORLOGE AU MENU"/msgstr "AFFICHER L'\''HORLOGE DANS LE MENU"/' \
-e 's/msgstr "AFFICHAGE DE L'\''AIDE AU MENU"/msgstr "AIDE À L'\''ÉCRAN"/' \
-e 's/msgstr "AFFICHER L'\''ÉTAT DE LA BATTERIE AU MENU"/msgstr "AFFICHER L'\''ÉTAT DE LA BATTERIE DANS LE MENU"/' \
-e 's/msgstr "SCANNE LE DOSSIER DES PORTAGES AU DÉMARRAGE"/msgstr "SCANNER LE DOSSIER DES PORTS AU DÉMARRAGE"/' \
-e 's/msgstr "PERFORMANCES AUTO DU CPU"/msgstr "GESTION DES PERFORMANCES DU CPU"/' \
-e 's/msgstr "DÉMARRER LA MISE A JOUR"/msgstr "DÉMARRER LA MISE À JOUR"/' \
-e 's/msgstr "INVERSER LES BOUTONS A\/B DE LA CONSOLE"/msgstr "INVERSER LES BOUTONS A\/B DANS EMULATIONSTATION"/' \
-e 's/msgstr "REDÉMARRER EMULE STATION"/msgstr "REDÉMARRER EMULATIONSTATION"/' \
-e 's/msgstr "QUITTER EMULE STATION"/msgstr "QUITTER EMULATIONSTATION"/' \
-e 's/msgstr "INFORMATIONS DU JEU SUR L'\''ÉCRAN DE VEILLE"/msgstr "AFFICHER LES INFOS DU JEU DANS L'\''ÉCRAN DE VEILLE"/' \
-e 's/msgstr "UTILISER LES LOGOS POUR LES INFOS JEU"/msgstr "UTILISER LA BANNIÈRE (MARQUEE) COMME INFO"/' \
-e 's/msgstr "CECI VA SUPPRIMER LE JEU ACTUEL !\\nÊTES-VOUS SÛR ?"/msgstr "CECI SUPPRIMERA LE(S) FICHIER(S) DU JEU !\\nÊTES-VOUS SÛR ?"/' \
-e 's/msgstr "DOSSIER D'\''IMAGE PERSONNALISÉES"/msgstr "DOSSIER D'\''IMAGES PERSONNALISÉES"/' \
-e 's/msgstr "METTRE À JOUR LES LISTES DES JEUX"/msgstr "METTRE À JOUR LES LISTES DE JEUX"/' \
-e 's/msgstr "AUCUN JEUX TROUVÉ - PASSER"/msgstr "AUCUN JEU TROUVÉ - PASSER"/' \
-e 's/msgstr "SHIFT POUR MAJUSCULES\/MINUSCULE ET DES CARACT. SPÉCIAUX"/msgstr "SHIFT POUR MAJUSCULES\/MINUSCULES ET CARACTÈRES SPÉCIAUX"/' \
-e 's/msgstr "RESET GAMELIST CUSTOMIZATIONS"/msgstr "RÉINITIALISER LES PERSONNALISATIONS DES LISTES DE JEUX"/' \
-e 's/msgstr "diaporama photo"/msgstr "diaporama"/' \
-e 's/msgstr "animée"/msgstr "glissement"/' \
-e 's/msgstr "THUMB"/msgstr "MINIATURE"/' \
-e 's/msgstr "haut parleur"/msgstr "haut-parleur"/' \
-e 's/msgstr "PUISSANTE"/msgstr "PERFORMANCE"/' \
-e 's/msgstr "moyen"/msgstr "À LA DEMANDE"/' \
-e 's/msgstr "délai d'\''expiration de l'\''écran de veuille (min)"/msgstr "Délai avant mise en veille (min)"/' \
-e 's/msgstr "veuillez redémarrer EmulationStation pour que vos modifications prennent effet"/msgstr "Veuillez redémarrer EmulationStation pour que vos modifications soient prises en compte."/' \
-e 's/msgstr "THEME SHOW CLOCK ON MENU"/msgstr "AFFICHER L'\''HORLOGE DANS LE MENU (THÈME)"/' \
-e 's/msgstr "REINITIALISER L'\''EXTENSIONS DES FICHIERS À AFFICHER"/msgstr "RÉINITIALISER LES EXTENSIONS DE FICHIERS"/' \
-e 's/msgstr "ALLER CHEZ LE FABRICANT"/msgstr "ALLER AU FABRICANT"/' \
"$LOCAL_FILE" || {
    echo "Erreur lors de l'application des corrections avec sed." | tee -a "$LOG_FILE"
  sleep 1
    exit 1
}

echo "Corrections appliquées avec succès." | tee -a "$LOG_FILE"
sleep 1

# --- Sauvegarde et remplacement ---
BACKUP_PATH="$TARGET_FILE.bak.$(date +%Y%m%d-%H%M%S)"
cp "$TARGET_FILE" "$BACKUP_PATH"
cp "$LOCAL_FILE" "$TARGET_FILE"
echo "Sauvegarde créée : $BACKUP_PATH" | tee -a "$LOG_FILE"
sleep 1
echo "Nouveau fichier installé." | tee -a "$LOG_FILE"
sleep 1

# --- Redémarrage ---
if command -v systemctl &>/dev/null && systemctl is-active --quiet "$ES_SERVICE"; then
    echo "Redémarrage d'EmulationStation."
sleep 2
    systemctl restart "$ES_SERVICE"
    echo "EmulationStation redémarré." | tee -a "$LOG_FILE"
else
    echo "EmulationStation n'est pas géré par systemctl ou n'est pas actif." | tee -a "$LOG_FILE"
    echo "Redémarrez-le manuellement pour appliquer les changements." | tee -a "$LOG_FILE"
sleep 2
fi

echo "Correction terminée avec succès !" | tee -a "$LOG_FILE"
sleep 2
exit 0
