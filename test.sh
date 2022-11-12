#!/bin/sh

g++ -std=c++11 -O2 -Wall fizzbuzz.cpp -o fizzbuzz
./fizzbuzz > c_output.txt

javac FizzBuzz.java 
java FizzBuzz.java > java_output.txt

go run fizzbuzz.go > go_output.txt

python3 fizzbuzz.py > py_output.txt

node fizzbuzz.js >js_output.txt

# check if diff is empty
tests_pass=true
declare -a langs=("c" "java" "go" "py" "js")

for i in "${langs[@]}"
do
    DIFF=$(diff correct_output.txt "$i"_output.txt)
    if [ "$DIFF" != "" ]
    then
        echo "$i test failed"
        tests_pass=false
    fi
done

if [ "$tests_pass" = true ] ; then
    echo 'All Tests Passed'
fi
