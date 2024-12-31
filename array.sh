#1/bin/bash

MOVIES=("balu" "sudheer")

echo "print:${MOVIES[@]}"
echo "$!"
sleep 60 &
echo "$$"