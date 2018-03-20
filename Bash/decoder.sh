# #!/bin/bash
# if [[ -e filter.txt ]]; then
# 	echo "Cleanup"
# 	rm -f filter.txt
# else
# 	touch filter.txt
# fi
# echo "Grepping File 1"
# grep error -A 1 logfile1.txt >> filter.txt
# echo "Grepping File 2"
# grep error -A 1 logfile2.txt >> filter.txt
#!/bin/bash
T1="foo"
T2="bar"
if [ "$T1" = "$T2" ]; then
    echo expression evaluated as true
else
	echo expression evaluated as false
fi