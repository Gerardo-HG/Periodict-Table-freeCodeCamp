#! /bin/bash  

PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"  

# Este es mi programa
# Añadiendo mas commits
# More commits

if [[ $1 ]]; then  
  # Validar que el argumento sea un número o una cadena no vacía
  if [[ "$1" =~ ^[0-9]+$ ]]; then  
    # Si es un número, usarlo como número atómico  
    RESULT_ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")  
  else  
    # Si no es un número, tratarlo como símbolo o nombre  
    RESULT_ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1' OR name='$1'")  
  fi  

  if [[ -z $RESULT_ELEMENT ]]; then  
    # Mensaje si no se encuentra el elemento en la base de datos  
    echo "I could not find that element in the database."  
  else  
    echo "$RESULT_ELEMENT" | while IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME; do  
        # Obtener las propiedades del elemento  
        PROPERTIES_ELEMENT=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")  

        # Leer las propiedades  
        echo "$PROPERTIES_ELEMENT" | while IFS='|' read -r TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT; do  
            # Formatear la salida  
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."  
        done  
    done   
  fi  
else  
  # Si no encuentra argumento
  echo -e "Please provide an element as an argument."  
fi  