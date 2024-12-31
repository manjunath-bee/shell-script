#1/bin/bash

MOVIES=("balu" "sudheer")

echo "print:${MOVIES[@]}"
sleep 60 &
echo "$$"
echo "$!"