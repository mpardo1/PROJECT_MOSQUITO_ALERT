# Bash Ordering Script  (3 groups)

# Call: 
# .~$ bash Ordering_3KK.sh [Name of File], in this case, Full_Parameter_Set.dat 

head -n 1 $1 > Title_Row.txt
awk '{ if ($13 < 100000.0) { print } }' $1 | sort -g -k 13 -s | awk 'NR==1 { temp=$13; ((temp+=2)) } NR>=1 { if ($13 <= temp) { print } }' > ${1/%.dat/_Ord.dat}; 

for f in *Ord.dat;
do
    cat Title_Row.txt $f > ${f/%.dat/ered.dat}
done

rm *Ord.dat
rm Title_Row.txt
