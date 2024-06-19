
for i in $(seq 1 50)
do 
touch ~/txt/$i.txt
done



find -path /root -name *.txt