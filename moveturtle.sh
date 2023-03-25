#!/bin/bash

COMANDO=$1 
LVEL=$2
AVEL=$3

if [ -z $LVEL ]; then
LVEL=2
AVEL=2
echo "você pode escolher a velocidade: ./moveturtle.sh [opcao] [velocidade-linear] [velocidade-angular]"

elif [ -z $AVEL ]; then
AVEL=2
echo "você pode escolher a velocidade angular também: ./moveturtle.sh [opcao] [velocidade-linear] [velocidade-angular]"

fi

if [ $COMANDO == 'frente' ]; then
rostopic pub /turtle1/cmd_vel/ geometry_msgs/Twist "linear: 
  x: $LVEL
  y: 0.0
  z: 0.0
angular: 
  x: 0.0
  y: 0.0
  z: 0.0"

elif [ $COMANDO == 'girar' ]; then
rostopic pub /turtle1/cmd_vel geometry_msgs/Twist "linear: 
  x: 0.0
  y: 0.0
  z: 0.0
angular: 
  x: 0.0
  y: 0.0
  z: $AVEL
"

elif [ $COMANDO == 'circulo' ]; then
rostopic pub /turtle1/cmd_vel geometry_msgs/Twist "linear: 
  x: $AVEL
  y: 0.
  z: 0.0
angular: 
  x: 0.0
  y: 0.0
  z: $LVEL
"

elif [ $COMANDO == 'lado' ]; then
rostopic pub /turtle1/cmd_vel geometry_msgs/Twist "linear: 
  x: 0.0
  y: $LVEL
  z: 0.0
angular: 
  x: 0.0
  y: 0.0
  z: 0.0
"

elif [ $COMANDO == 'ré' ]; then
rostopic pub /turtle1/cmd_vel geometry_msgs/Twist "linear: 
  x: 0.0
  y: $LVEL
  z: 0.0
angular: 
  x: 0.0
  y: 0.0
  z: $AVEL
"



else
echo "as opções são: frente, girar, circulo, lado e ré."

fi
