#! /bin/bash


#Multiline comment
: '

echo "Hello bash script"

#To pobiera wartość wpisaną do terminala i dopisuje do końca pliku
#cat >> file.txt


#Heredoc
cat <<EOF
this is example heredoc
asaf
EOF


count=2

#Musi być spacja pomiędzy if a [] tak samo w nawiasie musi byc odstęp między wartoscia
if (( $count < 10 ))
then
   echo "condition true"
elif (( $count <= 10 ))
then
    echo "Second block"
else
    echo "condition is false"
fi


if (( $count >=10 || $count <=10 ))
then
    echo "Condition met"
fi

case $count in
    1)
        echo "Fist case";;
    2)
        echo "second case";;
    3)
        echo "Third case";;
    *)
        echo "Default case";;
esac


number=1
#until loop will run until condition in braces is true
while (( $number <= 10 ))
do
    echo "$number"
    number=$((number + 1))
done

#{start..end..increment}
for i in {1..20..2}
do
    echo "For $i"
done


for (( i=1; i<5; i++ ))
do

    echo "Conventional loop $i"
    if (( $i == 3 ))
    then
        break
    fi

done


echo $1 $2 $3


args=("$@")
echo ${args[@]}
echo ${args}


while read line
do
    echo $line
done < "${1:-/dev/stdin}"


#1 represents STDOUT 2 represents STDERR
ls -al 1>file.txt 2>error.txt

# Skończyłem oglądać na string processing
#


#STRING OPERATIONS
echo "enter first string"
read st1

echo "enter second string"
read st2

if [ "$st1" \< "$st2" ]
then
    echo "smaller"
fi

conc=$st1$st2

echo ${conc^^}


#Arythmetic operations
n1=24
n2=33

echo $(( n1 + n2 ))
echo $(( 55 - 23 ))
echo $(expr 22 + 11)



#Converting bases
echo "Enter Hex number"
read hex

echo -n "$hex value is : "
echo "obase=10; ibase=16; $hex" | bc

car=("BMW" "TOYOTA" "HONDA")
#With ! show indexes
echo "${!car[@]}"
echo "${car[@]}"
#With # show how many values are in array
echo "${#car[@]}"

unset car[1]

echo "${car[@]}"

car[2]="Mercedes"

echo "${car[@]}"



function print(){

    echo $1 $2
}

print "HI this is test" 25

#result="Test"
function check(){
    result="Function called"
}

check

print $result


mkdir -p Directory
'

numbers=("ONE" "TWO" "THREE" "FOUR" "FIVE")

select number in ${numbers[@]}
do
    echo $number

    if [[ ! " ${numbers[@]} " =~ " ${number} " ]]
    then
        echo "Please select correct option"
    fi

done
